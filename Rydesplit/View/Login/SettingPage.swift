//
//  SettingPage.swift
//  RydeSplit
//
//  Created by Pooya on 2020-01-24.
//  Copyright © 2020 RydeSplit. All rights reserved.
//

import UIKit

@objc protocol SettingPageDelegate {
    func updateSettingPageBySeg()
}

class SettingPage: UIView {

    var appSettings = AppSettings()
    var settingPageDelegate : SettingPageDelegate!
    
    @IBOutlet weak var chooseLanguageSeg: UISegmentedControl!

    
    
    @IBAction func segLanguageUpdateAct(_ sender: UISegmentedControl) {
        AppSettings.GlobalVariable.userLearningLanguage = AppSettings.GlobalVariable.languages[chooseLanguageSeg.selectedSegmentIndex]
        //AppSettings.GlobalVariable.userMotherLanguage = AppSettings.GlobalVariable.userLearningLanguage
        //settingPageDelegate.updateSettingPageBySeg()
        print("language = \(AppSettings.GlobalVariable.userLearningLanguage) \(AppSettings.GlobalVariable.userMotherLanguage) ")
        appSettings.savePreValues()
    }

}
