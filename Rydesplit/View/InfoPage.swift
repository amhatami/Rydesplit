//
//  InfoPage.swift
//  RydeSplit
//
//  Created by Pooya on 2020-01-22.
//  Copyright © 2020 RydeSplit. All rights reserved.
//

import UIKit

class InfoPage: UIView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var given_name_textfield: UITextField!
    @IBOutlet weak var family_name_textfield: UITextField!
    @IBOutlet weak var email_textfield: UITextField!
    @IBOutlet weak var infol1: UILabel!
    @IBOutlet weak var infol2: UILabel!
    @IBOutlet weak var reciveNewsConfirm: UIButton!

    @IBAction func given_name_act(_ sender: Any) {
        AppSettings.User.given_name = self.given_name_textfield.text ?? ""
        print("phone_number = \(AppSettings.User.given_name)")
    }

    @IBAction func family_name_act(_ sender: Any) {
        AppSettings.User.family_name = self.family_name_textfield.text ?? ""
        print("phone_number = \(AppSettings.User.family_name)")
    }
    
    @IBAction func email_act(_ sender: Any) {
        AppSettings.User.email = self.email_textfield.text ?? ""
        print("phone_number = \(AppSettings.User.email)")
    }


}
