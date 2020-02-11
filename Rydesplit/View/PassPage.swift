//
//  PassPage.swift
//  RydeSplit
//
//  Created by Pooya on 2020-01-22.
//  Copyright © 2020 RydeSplit. All rights reserved.
//

import UIKit

class PassPage: UIView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var password_textfield: UITextField!
    @IBOutlet weak var passConfirmField: UITextField!
    @IBOutlet weak var passl1: UILabel!
    @IBOutlet weak var passl2: UILabel!

    
    @IBAction func email_act(_ sender: Any) {
        AppSettings.User.password = self.password_textfield.text ?? ""
        print("phone_number = \(AppSettings.User.password)")
    }
    
}
