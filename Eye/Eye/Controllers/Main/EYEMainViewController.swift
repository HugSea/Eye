//
//  EYEMainViewController.swift
//  Eye
//
//  Created by Jack on 16/11/8.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import UIKit

class EYEMainViewController: UITabBarController {

    // MARK: --------------------- Life Cycle ---------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(launchView)
        launchView.animationDidStop { (launchView) in
            self.launchRemoveAnimation()
        }
    }
    
    // MARK: --------------------- Private Methods ---------------------
    
    private func launchRemoveAnimation() {
        UIView.animate(withDuration: 1.0, animations: {
            self.launchView.alpha = 0
        }, completion: { completed in
            self.launchView.removeFromSuperview()
        })
    }

    // MARK: --------------------- Getters and Setters ---------------------
    private lazy var launchView: EYELaunchView = {
        var launchView: EYELaunchView = EYELaunchView.launchView()
        launchView.frame = self.view.bounds
        return launchView
    }()
}
