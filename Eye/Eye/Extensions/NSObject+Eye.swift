//
//  NSObject+Eye.swift
//  Eye
//
//  Created by Jack on 16/11/23.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import UIKit

extension NSObject {
    // 类名转字符串
    class var className: String {
        return String(describing: self)
    }
}
