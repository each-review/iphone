//
//  ClockTableViewCell.swift
//  iPhoneProject
//
//  Created by jeongminho on 2020/01/12.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class ClockTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var timeDifference: UILabel!
    
    var country: Country? {
        didSet {
            self.name.text = country?.name
            self.time.text = country?.time
            self.timeDifference.text = country?.timeDifference
        }
    }

}




