//
//  EYETextHeaderTableViewCell.swift
//  Eye
//
//  Created by 张庆杰 on 16/11/24.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import UIKit

class EYETextHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: --------------------- Getters and Setters ---------------------
    var title: String? {
        didSet {
            self.titleLabel.text = title
        }
    }
    
}
