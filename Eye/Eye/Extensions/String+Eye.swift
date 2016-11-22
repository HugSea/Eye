//
//  String+Eye.swift
//  Eye
//
//  Created by Jack on 16/11/22.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import Foundation
import UIKit

extension Int {
    func durationToTime(duration: Int) -> String {
        return "\(String(format: "%02d", duration / 60))' \(String(format: "%2d", duration % 60))\""
    }
}
