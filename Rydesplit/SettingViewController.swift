//
//  SettingViewController.swift
//  RydeSplit
//
//  Created by Pooya on 2020-01-24.
//  Copyright © 2020 RydeSplit. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    var dataManagment = DataManagment()
    var pageManagmnet = PageManagmnet()
    var thisPageInfo = AtiveElement()
    var appSettings = AppSettings()
    
    @IBOutlet weak var pageBodySubView: UIView!
    var refpageBodySubView :SettingPage!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appSettings.loadPreValues()
        thisPageInfo = pageManagmnet.getActivePageInfo(byPageName : "Settings")
        
        updatethisPage()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //subPageBodySubView
        if let subPageBodySubView = Bundle.main.loadNibNamed("SettingPage", owner: self
            , options: nil)?.first as? SettingPage {
            pageBodySubView.addSubview(subPageBodySubView)
            //subPageBodySubView.testPanelDelegate = self
            
            subPageBodySubView.frame.size.height = pageBodySubView.frame.size.height
            subPageBodySubView.frame.size.width = pageBodySubView.frame.size.width
            
            //            subPageBodySubView.activetap = "Test"
            //            subPageBodySubView.talkButtonView.customizeActive()
            //            subPageBodySubView.timeButtonView.customizeActive()
            
            refpageBodySubView = subPageBodySubView  // to ba able call outside of if block
        } //End OF subPageBodySubView
        
        updatethisPage()
        
    } //End OF override func viewDidLoad

    func updatethisPage(){
        
        refpageBodySubView.chooseLanguageSeg.selectedSegmentIndex = AppSettings.GlobalVariable.languages.firstIndex(where: { $0 == AppSettings.GlobalVariable.userLearningLanguage }) ?? 0
        
    }// END OF func updatethisPage()

}
