//
//  SignupPassViewController.swift
//  RydeSplit
//
//  Created by Pooya on 2020-01-22.
//  Copyright © 2020 RydeSplit. All rights reserved.
//

import UIKit

class SignupPassViewController: UIViewController,UITextFieldDelegate {

    var dataManagment = DataManagment()
    var pageManagmnet = PageManagmnet()
    var thisPageInfo = AtiveElement()
    var appSettings = AppSettings()
    var api = APIManagment()
    
    @IBOutlet weak var continuebtn: UIButton!
    @IBOutlet weak var pageBodySubView: UIView!
    var refpageBodySubView :PassPage!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appSettings.loadPreValues()
        thisPageInfo = pageManagmnet.getActivePageInfo(byPageName : "Signup")
        
        refpageBodySubView.password_textfield.delegate = self
        
        updatethisPage()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appSettings.loadPreValues()
        thisPageInfo = pageManagmnet.getActivePageInfo(byPageName : "Signup")
        
        refpageBodySubView = pageBodySubView.addNib("PassPage", owner: self)
        
        updatethisPage()
        
        continuebtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(signUpGoAct(_:))))
    } //End OF override func viewDidLoad()
    
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }

    //signUpGoAct  Create User and go to congrat page
    @objc func signUpGoAct(_ sender:UIButton) {
        print("test save signup pressed")
        
//        let parameters : [String : Any] =
//            ["email": "\(AppSettings.User.email)",
//                "phone_number":"\(AppSettings.User.phone_number)",
//               // "user_metadata":{},
//                "blocked":false,
//                "email_verified":false,
//                "phone_verified":false,
//                //"app_metadata":{},
//                "given_name":"\(AppSettings.User.given_name)",
//                "family_name":"\(AppSettings.User.family_name)",
//                "name":"\(AppSettings.User.family_name),\(AppSettings.User.given_name)",
//                "nickname":"NA",
//                "picture":"NA",
//                "user_id":"NA",
//                "connection": "Initial-Connection",
//                "password":"\(AppSettings.User.password)",
//                "verify_email": false,
//                "username": "\(AppSettings.User.given_name)"
//        ] //[:]

        var parameters : [String : Any]  = [
            "email": "john.doe@gmail.com",
            "phone_number": "+199999999999999",
            //"user_metadata": {},
            "blocked": false,
            "email_verified": false,
            "phone_verified": false,
            //"app_metadata": {},
            "given_name": "John",
            "family_name": "Doe",
            "name": "John Doe",
            "nickname": "Johnny",
            "picture": "https://secure.gravatar.com/avatar/15626c5e0c749cb912f9d1ad48dba440?s=480&r=pg&d=https%3A%2F%2Fssl.gstatic.com%2Fs2%2Fprofiles%2Fimages%2Fsilhouette80.png",
            "user_id": "abc",
            "connection": "Initial-Connection",
            "password": "secret",
            "verify_email": false,
            "username": "johndoe"
            ]
        
        var oneAuthAPI = Auth0API()
        oneAuthAPI.token = api.getOneToken()
        oneAuthAPI.action = "Creat a User"
        oneAuthAPI.method = "POST"
        oneAuthAPI.urlPath = "/api/v2/users"
        oneAuthAPI.parameters = parameters

        //TODO: creat a user
        //api.searchUsers(byToken : tempToken.access_token)
        let data = api.getRespondData(byAuth0API: oneAuthAPI)
    } //END OF @objc func logoutPressed(sender:UIButton)

} //End OF class SignupPassViewController: UIViewController
