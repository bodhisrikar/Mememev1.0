//
//  CustomMememeTextFieldDelegate.swift
//  Mememev1.0
//
//  Created by Srikar Thottempudi on 12/16/18.
//  Copyright © 2018 Srikar Thottempudi. All rights reserved.
//

import Foundation
import UIKit

class CustomMememeTextFieldDelegate: NSObject, UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        var newText = textField.text! as NSString
        if newText.isEqual(to: "top") || newText.isEqual(to: "bottom") {
            newText = ""
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
