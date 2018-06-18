//
//  UITextField.swift
//  InvisionApp
//
//  Created by Thanh Tung Vu on 6/18/18.
//  Copyright © 2018 Tung Vu. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setupDoneDismiss() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.dismissKeyboard))
        doneBarButton.tintColor = UIColor.blue
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.inputAccessoryView = keyboardToolbar
    }
    
    @objc func dismissKeyboard() {
        if self.isFirstResponder {
            self.resignFirstResponder()
        }
    }
    
}
