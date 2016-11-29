//
//  EYEConstant.swift
//  Eye
//
//  Created by Jack on 16/11/23.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import Foundation
import UIKit

let kWidthScale: CGFloat = UIScreen.main.bounds.size.width / 375.0
let kScreenWidth: CGFloat = UIScreen.main.bounds.width

struct EYEConstant {
    static let ScreenRect = UIScreen.main.bounds
    static let ScreenWidth: CGFloat = UIScreen.main.bounds.size.width
    static let ScreenHeight: CGFloat = UIScreen.main.bounds.size.height
    static let WidthScale: CGFloat = UIScreen.main.bounds.size.width / 375.0
    // TableViewCell高度
    // type = "video"
    static let TableViewCellHeight_VideoBeanForClient: CGFloat = kWidthScale * 214.0
    // type = "textHeader"
    static let TableViewCellHeight_TextHeader: CGFloat = kWidthScale * 50.0
    // type = "forwardFooter"
    static let TableViewCellHeight_ForwardFooter: CGFloat = 67.0
    // type = "blankFooter"
    static let TableViewCellHeight_BlankFooter: CGFloat = 7.0
    // type = "ItemCollection"
    static let TableViewCellHeight_ItemCollection: CGFloat = kWidthScale * 424.0
    // type = "VideoCollectionOfHorizontalScrollCard"
    static let TableViewCellHeight_VideoCollectionOfHorizontalScrollCard: CGFloat = 80 + kWidthScale * 200 + 92

    // CollectionViewCell Size
    // type = "VideoBeanForClient"
    static let CollectionViewCellSize_VideoBeanForClient: CGSize = CGSize(width: 260, height: 200)
    // type = "ActionCard"
    static let CollectionViewCellSize_ActionCard: CGSize = CGSize(width: 146, height: 200)
    // type = "CSVideoBeanForClient"
    static let CollectionViewCellSize_CSVideoBeanForClient: CGSize = CGSize(width: kScreenWidth - 36, height: 92 + kWidthScale * 200)
}
