//
//  EYEVideoBeanForClientTableViewCell.swift
//  Eye
//
//  Created by Jack on 16/11/23.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import UIKit

class EYEVideoBeanForClientTableViewCell: UITableViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: --------------------- Getters and Setters ---------------------

    var itemModel: ItemModel! {
        didSet {
            
        }
    }
    
}
