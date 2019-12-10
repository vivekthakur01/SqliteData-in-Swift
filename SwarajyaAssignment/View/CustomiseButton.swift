//
//  CustomiseButton.swift
//  SwarajyaAssignment
//
//  Created by Vivek Thakur on 08/12/19.
//  Copyright © 2019 Vivek Thakur. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    
    @IBInspectable var cornerRadius:CGFloat = 0
    @IBInspectable var borderWidth:CGFloat = 0
        // @IBInspectable var borderColor:UIColor = UIColor.init()
        
        
        {
        didSet{
            self.layer.cornerRadius = cornerRadius
            self.layer.borderWidth = borderWidth
            self.clipsToBounds = true
            //self.layer.borderColor = b
            
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
}


