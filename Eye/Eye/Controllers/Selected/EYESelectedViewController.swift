//
//  EYESelectedViewController.swift
//  Eye
//
//  Created by Jack on 16/11/21.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class EYESelectedViewController: EYEBaseViewController {

    // MARK: --------------------- Life Cycle ---------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        self.requestData()
    }
    
    // MARK: --------------------- Private Methods ---------------------
    private func requestData() {
        let parameters = [
            "f" : "iphone",
            "p_product" : "EYEPETIZER_IOS",
            "v" : "2.9.0",
            "vc" : "1604"
        ]
        Alamofire.request(EYEConstantURL.URL_Selected, method: .get, parameters: parameters).responseJSON { response in
            if let value = response.result.value {
                let sectionList = Mapper<EYESelectedModel>().map(JSONObject: value)
                let sectionModel = sectionList?.sectionList?[0]
                let itemModel = sectionModel?.itemList?[0]
                print(itemModel?.actionUrl)
            }
        }
    }

}
