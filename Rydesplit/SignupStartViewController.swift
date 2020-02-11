//
//  SignupStartViewController.swift
//  RydeSplit
//
//  Created by Pooya on 2019-12-27.
//  Copyright © 2019 RydeSplit. All rights reserved.
//

import UIKit

class SignupStartViewController: UIViewController, UIScrollViewDelegate {

    var dataManagment = DataManagment()
    var pageManagmnet = PageManagmnet()
    var thisPageInfo = AtiveElement()
    var appSettings = AppSettings()
    
    @IBOutlet weak var featuresScrollView: UIScrollView!
    @IBOutlet weak var featuresSubView: UIView!
    @IBOutlet weak var featurePageControl: UIPageControl!
    @IBOutlet weak var signupbtn: UIButton!
    @IBOutlet weak var loginbtn: UIButton!

    var featuresArr : [Features] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appSettings.loadPreValues()
        thisPageInfo = pageManagmnet.getActivePageInfo(byPageName : "Signup")
        
        updatethisPage()
        updateFeatures()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appSettings.loadPreValues()
        thisPageInfo = pageManagmnet.getActivePageInfo(byPageName : "Signup")
        
        featuresScrollView.isPagingEnabled = true
        featuresScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(3), height: featuresScrollView.bounds.height)
        featuresScrollView.showsHorizontalScrollIndicator = false
        
        featuresScrollView.delegate = self
        
        loadFeatures()
    }//END override func viewDidLoad()
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        featurePageControl.currentPage = Int(page)
    }//END func scrollViewDidScroll(_
    
    /// A function to load Features.xib file inside view and change elements
    /// with provided value.
    ///
    ///
    /// - Parameters: no parameter
    /// - Returns: no return
    ///   - no return : there is no return for this function
    /// - Author: Pooya Hatami
    func loadFeatures()  {
        for index in 0...2 {
            if let featureView = Bundle.main.loadNibNamed("Features", owner: self, options: nil)?.first as? Features {
                featuresArr.append(featureView)
                featuresArr[index].featuresImage.image = UIImage(named: thisPageInfo.lcd.text.findInkeyArray(lookfor: "feature\(index)img"))
                featuresArr[index].featuresTitle.text = thisPageInfo.lcd.text.findInkeyArray(lookfor: "feature\(index)t").fixNewLines() //feature["title"]
                featuresArr[index].featuresText.text = thisPageInfo.lcd.text.findInkeyArray(lookfor: "feature\(index)st").fixNewLines() //feature["subtext"]
                
                featuresScrollView.addSubview(featuresArr[index])
                featuresArr[index].frame.size.width = featuresSubView.frame.size.width
                featuresArr[index].frame.size.height = featuresSubView.frame.size.height
                featuresArr[index].frame.origin.x = CGFloat(index) * self.view.bounds.size.width
            }
            
        }
    }//END loadFeatures()
    
    func updateFeatures()  {
        for index in 0...2 {
                featuresArr[index].featuresImage.image = UIImage(named: thisPageInfo.lcd.text.findInkeyArray(lookfor: "feature\(index+1)img")) // feature["image"]!
                featuresArr[index].featuresTitle.text = thisPageInfo.key_array.text.findInkeyArray(lookfor: "feature\(index+1)t").fixNewLines()
            print(thisPageInfo.key_array.text.findInkeyArray(lookfor: "feature\(index+1)t").fixNewLines())
                featuresArr[index].featuresText.text = thisPageInfo.key_array.text.findInkeyArray(lookfor: "feature\(index+1)st").fixNewLines()
        }
    }//END loadFeatures()
    
    
    func updatethisPage(){
        signupbtn.setTitle(thisPageInfo.main_menu.text.findInkeyArray(lookfor: "signupbtn"), for: .normal)
        signupbtn.layer.cornerRadius = 10
        loginbtn.setTitle(thisPageInfo.main_menu.text.findInkeyArray(lookfor: "loginbtn"), for: .normal)
        loginbtn.layer.cornerRadius = 10
    }

} //end of class SignupStartViewController: UIViewController
