//
//  UIView+Frame.swift
//  Eye
//
//  Created by Jack on 16/11/23.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import UIKit

extension UIView {

    /// View增加手势
    ///
    /// - parameter target: 目标
    /// - parameter action: 事件
    public func viewAddAction(_ target: AnyObject, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tap)
    }

    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }

    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }

    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }

    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }

    public var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }

    public var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
}
