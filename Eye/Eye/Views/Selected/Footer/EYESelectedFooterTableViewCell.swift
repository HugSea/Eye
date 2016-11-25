//
//  EYESelectedFooterTableViewCell.swift
//  Eye
//
//  Created by Jack on 2016/11/24.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import UIKit

class EYESelectedFooterTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var arrowView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var content: String? {
        didSet {
            contentLabel.text = content
        }
    }

    func isShowSubviews(_ isShow: Bool) {
        contentLabel.isHidden = !isShow
        arrowView.isHidden = !isShow
    }
    
}
