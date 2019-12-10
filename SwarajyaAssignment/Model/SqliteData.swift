//
//  SqliteData.swift
//  
//
//  Created by Vivek Thakur on 08/12/19.
//

import Foundation
import SQLite3
class dataBaseLib{
    
        static let shareobj = dataBaseLib()
        var studentName = [String]()
        var studentClass = [String]()
        var studentSection = [String]()
   // var studentYr = [String]()
    
    func databasePath()->String
    {
        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = dir.first
      //  print(path)
        return path!+"mydataBase.sqlite"
    }
    func executeQuery(query:String)-> Bool{
        
        var db:OpaquePointer? = nil
        let dbPath = databasePath()
        var stmt:OpaquePointer? = nil
        var success:Bool = false
        
        if sqlite3_open(dbPath,&db) == SQLITE_OK{
            if sqlite3_prepare(db, query, -1, &stmt, nil) == SQLITE_OK{
                
                if sqlite3_step(stmt) == SQLITE_DONE{
                    success = true
                    print("done")
                }
                else{
                    print("Error in prepare:\(String(describing: sqlite3_errmsg(stmt!)))")
                }
            }
        }
        else{
            print("error in open:\(String(describing: sqlite3_errmsg(stmt!)))")
        }
        return success
    }
    func SelectallTask(query:String){
        var db:OpaquePointer? = nil
        let dbPath = databasePath()
        var stmt:OpaquePointer? = nil
        
        if sqlite3_open(dbPath,&db) == SQLITE_OK{
            if sqlite3_prepare(db, query, -1, &stmt, nil) == SQLITE_OK{
                studentName.removeAll()
                studentClass.removeAll()
                studentSection.removeAll()
               // studentYr.removeAll()
                while sqlite3_step(stmt) == SQLITE_ROW{
                    let sname = sqlite3_column_text(stmt, 0)
                    let name = String(cString: sname!)
                    studentName.append(name)
                    let sclass = sqlite3_column_text(stmt, 1)
                    let class1 = String(cString: sclass!)
                    studentClass.append(class1)
                    let section = sqlite3_column_text(stmt, 2)
                    let sec = String(cString: section!)
                    studentSection.append(sec)
//                    let yr = sqlite3_column_text(stmt, 3)
//                    let yrs = String(cString: yr!)
//                    studentYr.append(yrs)
                    
                }
                
            }
            else{
                //print("error in prepare:\(sqlite3_errmsg(stmt!))")
                print("select")
            }
        }
        else{
            //print("error in open:\(sqlite3_errmsg(stmt!))")
            print("deselect")
        }
    }
    
    func createTable(){
            let createqry = "create table if not exists studentTable(studentName text,studentClass text,studentSection text)"
            let isSuccess = executeQuery(query: createqry)
        if isSuccess{
            print("table creation:success")
        }
        else{
            print("table creation: Failed")
        }
    }
}
