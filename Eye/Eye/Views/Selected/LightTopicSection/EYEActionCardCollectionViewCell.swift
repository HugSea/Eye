//
//  EYEActionCardCollectionViewCell.swift
//  Eye
//
//  Created by Jack on 2016/11/25.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import UIKit

class EYEActionCardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var contentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var title: String? {
        didSet {
            contentLabel.text = title
            let attribute: NSMutableAttributedString = NSMutableAttributedString(string: contentLabel.text!)
            attribute.addAttributes([NSKernAttributeName: NSNumber(value: 2.5)], range: NSMakeRange(0, (contentLabel.text?.characters.count)!))
            contentLabel.attributedText = attribute
        }
    }

}
