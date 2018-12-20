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
    var isOriginalTextEdited = true
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if isOriginalTextEdited {
            textField.text = ""
            isOriginalTextEdited = false
        }
    }
    
    // Mark Up : Keyboard should be hidden as soon as the user clicks on return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
