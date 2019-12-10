//
//  ShowViewController.swift
//  SwarajyaAssignment
//
//  Created by Vivek Thakur on 08/12/19.
//  Copyright © 2019 Vivek Thakur. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    
    
        var name = String()
        var classes = String()
        var section = String()
   

    
    
    @IBOutlet weak var lblName: CustomLabel!
    @IBOutlet weak var lblSection: CustomLabel!
   
    
    @IBOutlet weak var lblClass: CustomLabel!
    @IBOutlet var tagShowlbl: [CustomLabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblName.text = name
        lblClass.text = classes
        lblSection.text = section
       
        
    }
   
    @IBAction func addBtn(_ sender: UIButton) {
        let add = storyboard?.instantiateViewController(withIdentifier: "AddStudentViewController")as! AddStudentViewController
        navigationController?.pushViewController(add, animated: true)
    }
    
}
