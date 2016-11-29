//
//  EYEVideoBeanForClientCollectionViewCell.swift
//  Eye
//
//  Created by Jack on 2016/11/25.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import UIKit

class EYEVideoBeanForClientCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var itemModel: ItemModel? {
        didSet {
            picView.kf.setImage(with: URL(string: (itemModel?.feed)!))
            titleLabel.text = itemModel?.title
            subTitleLabel.text = itemModel?.cd_SubTitle
        }
    }

}
