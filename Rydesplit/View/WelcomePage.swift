//
//  WelcomePage.swift
//  RydeSplit
//
//  Created by Pooya on 2020-01-20.
//  Copyright © 2020 RydeSplit. All rights reserved.
//

import UIKit

class WelcomePage: UIView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var loginBySocialBtn: UIButton!    
    @IBOutlet weak var welcomel1: UILabel!
    @IBOutlet weak var welcomel3: UILabel!

    @IBOutlet weak var phone_number_textfield: UITextField!
    
    @IBAction func phone_number_act(_ sender: Any) {
        AppSettings.User.phone_number = self.phone_number_textfield.text ?? ""
        print("phone_number = \(AppSettings.User.phone_number)")
    }
    
}
