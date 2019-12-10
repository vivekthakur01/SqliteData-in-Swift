//
//  ViewController.swift
//  SwarajyaAssignment
//
//  Created by Vivek Thakur on 08/12/19.
//  Copyright © 2019 Vivek Thakur. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
            var allStudentName = [String]()
            var allStudentClass = [String]()
            var allStudentSection = [String]()
   
    
    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {

            let selectQry = "select studentName,studentClass,studentSection from studentTable"
            dataBaseLib.shareobj.SelectallTask(query: selectQry)
            allStudentName = dataBaseLib.shareobj.studentName
            allStudentClass = dataBaseLib.shareobj.studentClass
            allStudentSection = dataBaseLib.shareobj.studentSection
        //    allstudentYear = dataBaseLib.shareobj.studentYr
            detailTableView.reloadData()
           // allStudentName
            
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func addBtn(_ sender: UIButton) {
            let add = storyboard?.instantiateViewController(withIdentifier: "AddStudentViewController")as! AddStudentViewController
            navigationController?.pushViewController(add, animated: true)
    }
    
}



extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.allStudentName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! StudentCell
            cell.lblMain.text = allStudentName[indexPath.row]
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let showDetail = storyboard?.instantiateViewController(withIdentifier: "ShowViewController")as!ShowViewController
            navigationController?.pushViewController(showDetail, animated: true)
            showDetail.name = allStudentName[indexPath.row]
            showDetail.classes = allStudentClass[indexPath.row]
            showDetail.section = allStudentSection[indexPath.row]
   
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//            if editingStyle == .delete{
//
//            allStudentName.remove(at: indexPath.row)
//
//            detailTableView.deleteRows(at: [indexPath], with: .fade)
//            let deleteQuery = "delete from studentTable where studentName = '\(allStudentName[indexPath.row])'"
//            let isSuccess = dataBaseLib.shareobj.executeQuery(query: deleteQuery)
//
//            if isSuccess == true{
//                print("deletation success")
//            }
//
//            else{
//                print("deletation failed")
//            }
//        }
//    }
    
}

