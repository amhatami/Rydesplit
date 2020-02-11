//
//  Features.swift
//  RydeSplit
//
//  Created by Pooya on 2019-12-27.
//  Copyright © 2019 RydeSplit. All rights reserved.
//

import UIKit

/// Class for connecting and to Feauters.xib file elements
///
/// - Parameters:
///   - featuresImage: image for feature.
///   - featuresTitle: title for feature.
///   - featuresText: detail for feature.
/// - Author: Pooya Hatami
class Features: UIView {

    @IBOutlet weak var featuresImage: UIImageView!
    @IBOutlet weak var featuresTitle: UILabel!
    @IBOutlet weak var featuresText: UILabel!

    //MARK: customizing xib file will be done in SignupStartViewController.swift
}
