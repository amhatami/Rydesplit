//
//  LoginBySocialViewController.swift
//  RydeSplit
//
//  Created by Pooya on 2020-01-23.
//  Copyright © 2020 RydeSplit. All rights reserved.
//

import UIKit
import Auth0

class LoginBySocialViewController: UIViewController {

    var dataManagment = DataManagment()
    var pageManagmnet = PageManagmnet()
    var thisPageInfo = AtiveElement()
    var appSettings = AppSettings()
    var api = APIManagment()
    
    @IBOutlet weak var continuebtn: UIButton!
    @IBOutlet weak var pageBodySubView: UIView!
    var refpageBodySubView :SocialLoginPageTest!
//    var refpageBodySubView : LoginInfoPage!
    var profile: UserInfo!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appSettings.loadPreValues()
        thisPageInfo = pageManagmnet.getActivePageInfo(byPageName : "Signup")
        
        updatethisPage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appSettings.loadPreValues()
        thisPageInfo = pageManagmnet.getActivePageInfo(byPageName : "Signup")
        
        refpageBodySubView = pageBodySubView.addNib("SocialLoginPageTest", owner: self)
        //refpageBodySubView = pageBodySubView.addNib("LoginInfoPage", owner: self)

        var usertoke = SessionManager.shared.credentials?.accessToken
        print("token = \(usertoke)")
        
        profile = SessionManager.shared.profile
        
        refpageBodySubView.welcomeLabel.text = "Welcome, \(self.profile.name ?? "no  name")"
        refpageBodySubView.userName.text = "\(self.profile.givenName ?? "NA")"
        refpageBodySubView.userLastName.text = "\(self.profile.familyName ?? "NA")"
        refpageBodySubView.UserEmail.text = "\(self.profile.email ?? "NA")"
        refpageBodySubView.metaDataView.text = usertoke
        
//        refpageBodySubView.firstNameField.text = self.profile.givenName
//        refpageBodySubView.lastNameField.text = self.profile.familyName ?? "NA"
//        refpageBodySubView.emailField.text = self.profile.email ?? "NA"

        guard let pictureURL = self.profile.picture else { return }
        let task = URLSession.shared.dataTask(with: pictureURL) { (data, response, error) in
            guard let data = data , error == nil else { return }
            DispatchQueue.main.async {
                self.refpageBodySubView.avatarImageView.image = UIImage(data: data)
            }
        }
        task.resume()
        
    } //End OF subPageBodySubView
    
    
    @objc func logoutPressed(sender:UIButton) {
        SessionManager.shared.logout { error in
            
            guard error == nil else {
                return print("Error revoking token: \(error)")
            }
            
            DispatchQueue.main.async {
                self.presentingViewController?.dismiss(animated: true, completion: nil)
            }
            
            self.profile = nil
            SessionManager.shared.profile = nil
        }
    } //END OF @objc func logoutPressed(sender:UIButton)
    
    @objc func tokenCreatorPressed(sender:UIButton) {
        print("test api pressed")
        _ = api.getOneToken()
    } //END OF @objc func logoutPressed(sender:UIButton)
    
    @objc func searchUsersPressed(sender:UIButton) {
        print("test api pressed")
        let tempToken = api.getOneToken()
        //api.searchUsers(byToken : tempToken.access_token)
        let jsonString = api.getListOfUsers(byToken: tempToken.access_token)
        refpageBodySubView.metaDataView.text = jsonString
    } //END OF @objc func logoutPressed(sender:UIButton)

    
    
    func updatethisPage(){
        continuebtn.setTitle(thisPageInfo.main_menu.text.findInkeyArray(lookfor: "continuebtn"), for: .normal)
        continuebtn.layer.cornerRadius = 10
        
        refpageBodySubView.logoutBtn.addTarget(self, action: #selector(LoginBySocialViewController.logoutPressed(sender:)), for: .touchUpInside)

        refpageBodySubView.tokenBtn.addTarget(self, action: #selector(LoginBySocialViewController.tokenCreatorPressed(sender:)), for: .touchUpInside)

        refpageBodySubView.searchBtn.addTarget(self, action: #selector(LoginBySocialViewController.searchUsersPressed(sender:)), for: .touchUpInside)

    }// END OF func updatethisPage()

    
} //End OF class LoginBySocialViewController: UIViewController
