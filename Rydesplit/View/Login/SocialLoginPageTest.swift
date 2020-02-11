//
//  SocialLoginPageTest.swift
//  RydeSplit
//
//  Created by Pooya on 2020-01-31.
//  Copyright © 2020 RydeSplit. All rights reserved.
//

import UIKit
import Auth0

class SocialLoginPageTest: UIView {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLastName: UILabel!
    @IBOutlet weak var UserEmail: UILabel!
    
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var tokenBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!

    @IBOutlet weak var metaDataView: UITextView!
}
