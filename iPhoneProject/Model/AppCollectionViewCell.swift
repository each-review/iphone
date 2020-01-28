//
//  AppCollectionViewCell.swift
//  iPhoneProject
//
//  Created by jeongminho on 2020/01/06.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class AppCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var appImage: UIImageView!
    @IBOutlet var appName: UILabel!
    
    var app: App? {
        didSet {
            appImage.image = app?.appIcon
            appName.text = app?.appTitle
        }
    }
}

