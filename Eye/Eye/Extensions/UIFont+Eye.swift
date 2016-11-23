//
//  UIFont+Eye.swift
//  Eye
//
//  Created by Jack on 16/11/23.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {

    /// 自定义粗体
    ///
    /// - parameter size: 字体大小，默认15
    ///
    /// - returns: 自定义粗体
    func customFont_FZLTZCHJW(fontSize size: CGFloat = 15.0) -> UIFont {
        return UIFont(name: "FZLanTingHeiS-DB1-GB", size: size)!;
    }


    /// 自定义细体
    ///
    /// - parameter size: 字体大小，默认15
    ///
    /// - returns: 自定义细体
    func customFont_FZLTXIHJW(fontSize size: CGFloat = 15.0) -> UIFont {
        return UIFont(name: "FZLanTingHeiS-L-GB", size: size)!;
    }


    /// 自定义开眼特色字体
    ///
    /// - parameter size: 字体大小，默认15
    ///
    /// - returns: 自定义开眼特色字体
    func customFont_Lobster(fontSize size: CGFloat = 15.0) -> UIFont {
        return UIFont(name: "Lobster 1.4", size: size)!;
    }
}
