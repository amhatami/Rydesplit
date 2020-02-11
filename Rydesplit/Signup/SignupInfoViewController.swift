//
//  SignupInfoViewController.swift
//  RydeSplit
//
//  Created by Pooya on 2020-01-22.
//  Copyright © 2020 RydeSplit. All rights reserved.
//

import UIKit

class SignupInfoViewController: UIViewController,UITextFieldDelegate {

    var dataManagment = DataManagment()
    var pageManagmnet = PageManagmnet()
    var thisPageInfo = AtiveElement()
    var appSettings = AppSettings()
    
    @IBOutlet weak var continuebtn: UIButton!
    @IBOutlet weak var pageBodySubView: UIView!
    var refpageBodySubView :InfoPage!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appSettings.loadPreValues()
        thisPageInfo = pageManagmnet.getActivePageInfo(byPageName : "Signup")
        
        refpageBodySubView.given_name_textfield.delegate = self
        refpageBodySubView.family_name_textfield.delegate = self
        refpageBodySubView.email_textfield.delegate = self

        
        updatethisPage()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appSettings.loadPreValues()
        thisPageInfo = pageManagmnet.getActivePageInfo(byPageName : "Signup")
        
        refpageBodySubView = pageBodySubView.addNib("InfoPage", owner: self)

        updatethisPage()
    } //End OF override func viewDidLoad()
    
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }

    
} //End OF class SignupInfoViewController: UIViewController
