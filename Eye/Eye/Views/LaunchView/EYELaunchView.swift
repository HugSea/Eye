//
//  EYELaunchView.swift
//  Eye
//
//  Created by 张庆杰 on 16/11/16.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import UIKit

class EYELaunchView: UIView {
    // 背景图片
    @IBOutlet weak var bgView: UIImageView!
    // 黑色背景
    @IBOutlet weak var blackView: UIView!
    // 动画结束回调
    typealias AnimationDidStopCallBack = (_ launchView: EYELaunchView) -> Void
    var callBack: AnimationDidStopCallBack?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        startAnimation()
    }
    
    class func launchView() -> EYELaunchView {
        return Bundle.main.loadNibNamed("EYELaunchView", owner: nil, options: nil)?.first as! EYELaunchView
    }
    
    // 开始动画：黑色渐渐消失，背景放大
    private func startAnimation() {
        UIView.animate(withDuration: 5.0, delay: 1.0, options: .curveEaseInOut, animations: {
            self.blackView.alpha = 0.0
            self.bgView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }, completion: { completed in
            self.blackView.removeFromSuperview()
            if let callBack = self.callBack {
                callBack(self)
            }
        })
    }
    
    // 结束动画回调
    func animationDidStop(_ callBack: AnimationDidStopCallBack?) {
        self.callBack = callBack
    }
}
