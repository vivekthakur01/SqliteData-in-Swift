//
//  AddStudentViewController.swift
//  SwarajyaAssignment
//
//  Created by Vivek Thakur on 08/12/19.
//  Copyright © 2019 Vivek Thakur. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController,UIAlertViewDelegate {
    
    
    
    @IBOutlet var tagShowlbl: [CustomLabel]!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtClass: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var txtSection: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveDataButton(_ sender: UIButton) {

        
        let aaa = "insert into studentTable(studentName,studentClass,studentSection) values ('\(txtName.text ?? "No Details Input")','\(txtClass.text ?? "No Details Input")','\(txtSection.text ?? "No Details Input")')"
        let issuccess = dataBaseLib.shareobj.executeQuery(query: aaa)
        if issuccess{
            print("insert Success")
            navigationController?.popToRootViewController(animated: true)
        }
        else{
            print("insert Failed")
        }
        }
    
   
}
