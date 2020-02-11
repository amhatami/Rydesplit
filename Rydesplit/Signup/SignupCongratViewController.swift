//
//  SignupCongratViewController.swift
//  RydeSplit
//
//  Created by Pooya on 2020-01-22.
//  Copyright © 2020 RydeSplit. All rights reserved.
//

import UIKit
import AVFoundation

class SignupCongratViewController: UIViewController {

    var dataManagment = DataManagment()
    var pageManagmnet = PageManagmnet()
    var thisPageInfo = AtiveElement()
    var appSettings = AppSettings()
    var soundEffect: AVAudioPlayer?
    
    @IBOutlet weak var funView: UIView!
    @IBOutlet weak var funimageView: UIImageView!

    @IBOutlet weak var continuebtn: UIButton!
    @IBOutlet weak var pageBodySubView: UIView!
    var refpageBodySubView :CongratPage!
    
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

        refpageBodySubView = pageBodySubView.addNib("CongratPage", owner: self)
            
        updatethisPage()
        
        self.funView.alpha = 0
        view.addSubview(funView)
    
        
    } //End OF override func viewDidLoad()

    
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
    
    
} //END OF class SignupCongratViewController: UIViewController
