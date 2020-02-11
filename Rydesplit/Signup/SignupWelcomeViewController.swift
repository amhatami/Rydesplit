//
//  SignupWelcomeViewController.swift
//  RydeSplit
//
//  Created by Pooya on 2020-01-20.
//  Copyright © 2020 RydeSplit. All rights reserved.
//

import UIKit
import Auth0

class SignupWelcomeViewController: UIViewController,UITextFieldDelegate {

    var dataManagment = DataManagment()
    var pageManagmnet = PageManagmnet()
    var thisPageInfo = AtiveElement()
    var appSettings = AppSettings()
    //var abouts = About()
    
    @IBOutlet weak var continuebtn: UIButton!
    @IBOutlet weak var pageBodySubView: UIView!
    var refpageBodySubView :WelcomePage!
    
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
        
        refpageBodySubView = pageBodySubView.addNib("WelcomePage", owner: self)
        
        refpageBodySubView.phone_number_textfield.delegate = self
        
        updatethisPage()
    } //End OF override func viewDidLoad()
    
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
    @objc func showSegueButtonPressed(sender:UIButton) {
//        print("go to Scocial!!")
//        self.performSegue(withIdentifier: "pushSegueToSocial", sender: nil)
        SessionManager.shared.patchMode = true
        self.checkToken() {
            self.showLoginWithPatch()
        }

    }

    // MARK: - Private
    
    fileprivate func showLogin() {
        guard let clientInfo = plistValues(bundle: Bundle.main) else { return }
        SessionManager.shared.patchMode = false
        Auth0
            .webAuth()
            .scope("openid profile email phone offline_access")
            .audience("https://" + clientInfo.domain + "/userinfo")
            .start {
                switch $0 {
                case .failure(let error):
                    print("Error: \(error)")
                case .success(let credentials):
                    if(!SessionManager.shared.store(credentials: credentials)) {
                        print("Failed to store credentials")
                    } else {
                        SessionManager.shared.retrieveProfile { error in
                            DispatchQueue.main.async {
                                guard error == nil else {
                                    print("Failed to retrieve profile: \(String(describing: error))")
                                    return self.showLogin()
                                }
                                self.performSegue(withIdentifier: "pushSegueToSocial", sender: nil)
                            }
                        }
                    }
                }
        }
    }//ENDOF fileprivate func showLogin()
    
    fileprivate func showLoginWithPatch() {
        guard let clientInfo = plistValues(bundle: Bundle.main) else { return }
        SessionManager.shared.patchMode = true
        Auth0
            .webAuth()
            .scope("openid profile email phone offline_access read:current_user update:current_user_metadata")
            .audience("https://" + clientInfo.domain + "/api/v2/")
            .start {
                switch $0 {
                case .failure(let error):
                    print("Error: \(error)")
                case .success(let credentials):
                    if(!SessionManager.shared.store(credentials: credentials)) {
                        print("Failed to store credentials")
                    } else {
                        SessionManager.shared.retrieveProfile { error in
                            DispatchQueue.main.async {
                                guard error == nil else {
                                    print("Failed to retrieve profile: \(String(describing: error))")
                                    return self.showLogin()
                                }
                                self.performSegue(withIdentifier: "pushSegueToSocial", sender: nil)
                            }
                        }
                    }
                }
        }
    }// ENDOF fileprivate func showLoginWithPatch()
    
    fileprivate func checkToken(callback: @escaping () -> Void) {
        let loadingAlert = UIAlertController.loadingAlert()
        loadingAlert.presentInViewController(self)
        SessionManager.shared.renewAuth { error in
            DispatchQueue.main.async {
                loadingAlert.dismiss(animated: true) {
                    guard error == nil else {
                        print("Failed to retrieve credentials: \(String(describing: error))")
                        return callback()
                    }
                    SessionManager.shared.retrieveProfile { error in
                        DispatchQueue.main.async {
                            guard error == nil else {
                                print("Failed to retrieve profile: \(String(describing: error))")
                                return callback()
                            }
                            self.performSegue(withIdentifier: "pushSegueToSocial", sender: nil)
                        }
                    }
                }
            }
        }
    }// ENDOF fileprivate func checkToken(callback: @escaping () -> Void)
    
} //End OF class SignupWelcomeViewController: UIViewController




