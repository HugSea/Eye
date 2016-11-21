//
//  EYESelectedModel.swift
//  Eye
//
//  Created by Jack on 16/11/21.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import UIKit

struct EYESelectedModel {
    // 时间
    var date: Int!
    // 下一次发布时间
    var nextPublishTime: Int!
    // 展示的组列表
    var sectionList: [SectionModel] = [SectionModel]()
    // 组数量
    var count: Int!
    // 下一页地址
    var nextPageUrl: String!
}

struct SectionModel {
    //
}
