//
//  EYEConstantURL.swift
//  Eye
//
//  Created by 张庆杰 on 16/11/21.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import Foundation

struct EYEConstantURL {
    static let URL_Base_V2 = "http://baobab.kaiyanapp.com/api/v2/"
    static let URL_Base_V3 = "http://baobab.kaiyanapp.com/api/v3/"
    // 精选
    // 参数：1._s=f08204255c7762207cb0c5f155b3b4f6 *2.f=iphone 3.net=wifi *4.p_product=EYEPETIZER_IOS 5.u=f10f96912f453ec07a90ede621e53e37bccb016e *6.v=2.9.0 *7.vc=1604
    static let URL_Selected = URL_Base_V3 + "tabs/selected"
    // 发现
    // 参数：1._s=7a7ca52c0a5cd550b2a55deb8835c307 *2.f=iphone 3.net=wifi *4.p_product=EYEPETIZER_IOS 5.u=f10f96912f453ec07a90ede621e53e37bccb016e *6.v=2.9.0 *7.vc=1604
    static let URL_Discovery = URL_Base_V3 + "discovery"
    // 作者
    // 参数：1._s=13272bd517e3792eef21d69898b58439 *2.f=iphone 3.net=wifi *4.p_product=EYEPETIZER_IOS 5.u=f10f96912f453ec07a90ede621e53e37bccb016e *6.v=2.9.0 *7.vc=1604
    static let URL_Author = URL_Base_V3 + "tabs/pcgs"

    // TableViewCell高度
    static let TableViewCellHeight_VideoBeanForClient = 214.0

}
