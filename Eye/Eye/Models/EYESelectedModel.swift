//
//  EYESelectedModel.swift
//  Eye
//
//  Created by Jack on 16/11/21.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import UIKit
import ObjectMapper

struct EYESelectedModel: Mappable {
    // 时间
    var date: Int?
    // 下一次发布时间
    var nextPublishTime: Int?
    // 展示的组列表
    var sectionList: [SectionModel]?
    // 组数量
    var count: Int?
    // 下一页地址
    var nextPageUrl: String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        date            <- map["date"]
        nextPublishTime <- map["nextPublishTime"]
        sectionList     <- map["sectionList"]
        count           <- map["count"]
        nextPageUrl     <- map["nextPageUrl"]
    }

}

struct SectionModel: Mappable {
    // id
    var id: Int!
    // 类型
    var type: String!
    // Item列表
    var itemList: [ItemModel]?
    // 数量
    var count: Int!
    // Footer
    var footer: FooterModel?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        id          <- map["id"]
        type        <- map["type"]
        itemList    <- map["itemList"]
        count       <- map["count"]
        footer      <- map["footer"]
    }
}

struct ItemModel: Mappable {
    // 类型
    var type: String!
    // data
    // 数据类型
    var dataType: String!

    // TextHeader
    var text: String?
    var font: String?

    // VideoCollection
    var cover: String?
    
    // Banner
    var image: String?
    var clickUrl: String?
    var actionUrl: String?

    var id : Int?
    // 标题
    var title: String?
    // 描述
    var description: String?
    // 分类
    var category: String?
    // 背景图
    var feed: String?
    // 模糊背景
    var blurred: String?
    // url
    var playUrl: String?
    // 时间
    var duration: Int?
    // 副标题
    var subTitle : String! {
        get {
            if let _ = category, let _ = duration {
                return "#\(category!)  /  \(Int.durationToTime(duration!))"
            } else {
                return ""
            }
        }
    }
    // 喜欢数
    var collectionCount: Int?
    // 分享数
    var shareCount: Int?
    // 评论数
    var replyCount: Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        type            <- map["type"]
        dataType        <- map["data.dataType"]
        text            <- map["data.text"]
        font            <- map["data.font"]
        cover           <- map["data.header.cover"]
        image           <- map["data.image"]
        actionUrl       <- map["data.actionUrl"]
        clickUrl        <- map["data.adTrack.0.clickUrl"]
        id              <- map["data.id"]
        title           <- map["data.title"]
        description     <- map["data.description"]
        category        <- map["data.category"]
        feed            <- map["data.cover.feed"]
        blurred         <- map["data.cover.blurred"]
        playUrl         <- map["data.playUrl"]
        duration        <- map["data.duration"]
        collectionCount <- map["data.consumption.collectionCount"]
        shareCount      <- map["data.consumption.shareCount"]
        replyCount      <- map["data.consumption.replyCount"]
    }
}

struct FooterModel: Mappable {
    // 类型
    var type: String?
    // 内容
    var text: String?
    // 字体
    var font: String?
    // ActionUrl
    var actionUrl: String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        type        <- map["type"]
        text        <- map["data.text"]
        font        <- map["data.font"]
        actionUrl   <- map["data.actionUrl"]
    }
}
