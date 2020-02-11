//
//  LoginConfirmInfoViewController.swift
//  RydeSplit
//
//  Created by Pooya on 2020-01-23.
//  Copyright © 2020 RydeSplit. All rights reserved.
//

import UIKit
import Auth0
import AVFoundation


class LoginConfirmInfoViewController: UIViewController {

    var dataManagment = DataManagment()
    var pageManagmnet = PageManagmnet()
    var thisPageInfo = AtiveElement()
    var appSettings = AppSettings()
    var soundEffect: AVAudioPlayer?
    
    @IBOutlet weak var funView: UIView!
    @IBOutlet weak var funimageView: UIImageView!
    @IBOutlet weak var continuebtn: UIButton!
    @IBOutlet weak var pageBodySubView: UIView!
    var refpageBodySubView :LoginInfoPage!
    var profile: UserInfo!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appSettings.loadPreValues()
        thisPageInfo = pageManagmnet.getActivePageInfo(byPageName : "Signup")
        profile = SessionManager.shared.profile
        
        updatethisPage()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appSettings.loadPreValues()
        thisPageInfo = pageManagmnet.getActivePageInfo(byPageName : "Signup")
        profile = SessionManager.shared.profile
        
        refpageBodySubView = pageBodySubView.addNib("LoginInfoPage", owner: self)
        
        self.funView.alpha = 0
        view.addSubview(funView)
        
    } //End OF override func viewDidLoad
    
    
    @IBAction func continueAct(_ sender: Any) {
        let tapGroup = DispatchGroup()
        funimageView.image = UIImage(named: getImage())
        playRndVoice()
        
        
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            tapGroup.enter()
            let _ = tapGroup.wait(timeout:DispatchTime.now() + 1.2)
            self.hideResultForQuestion()
        })
        showResultForQuestion()
        CATransaction.commit()
        
    }
    
} //End OF class LoginConfirmInfoViewController: UIViewController
