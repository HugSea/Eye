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

class EYESelectedViewController: EYEBaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var sectionList: [SectionModel] = [SectionModel]()

    // MARK: --------------------- Life Cycle ---------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        self.requestData()
    }

    // MARK: --------------------- TableViewDataSource / Delegate ---------------------

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //sectionList.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionModel = sectionList[section]
        let itemList = sectionModel.itemList
        return (itemList?.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 获取模型
        let sectionModel = sectionList[indexPath.section]
        let itemModel: ItemModel = sectionModel.itemList![indexPath.row]

        var cell = UITableViewCell()
        switch sectionModel.type {
        case "feedSection":
            cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(EYEVideoBeanForClientTableViewCell.self)) as! EYEVideoBeanForClientTableViewCell
            return cell
        default:
            break
        }
        return cell
    }
    
    // MARK: --------------------- Private Methods ---------------------
    private func setupUI() {
        // 注册VideoBeanForClientCell
        self.tableView.register(UINib.init(nibName: NSStringFromClass(EYEVideoBeanForClientTableViewCell.self), bundle: nil), forCellReuseIdentifier: NSStringFromClass(EYEVideoBeanForClientTableViewCell.self))
    }

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
                self.sectionList = (sectionList?.sectionList)!
            }
        }
    }

    // MARK: --------------------- Getters and Setters ---------------------

    

}
