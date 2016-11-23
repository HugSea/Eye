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

    @IBOutlet weak var tableView: UITableView!

    var sectionList: [SectionModel] = [SectionModel]()

    // MARK: --------------------- Life Cycle ---------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        requestData()
    }

    // MARK: --------------------- Private Methods ---------------------
    private func setupUI() {
        // 注册VideoBeanForClientCell
        tableView.register(UINib(nibName: EYEVideoBeanForClientTableViewCell.className, bundle: nil), forCellReuseIdentifier: EYEVideoBeanForClientTableViewCell.className)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }

    private func requestData() {
        let parameters = [
            "f" : "iphone",
            "p_product" : "EYEPETIZER_IOS",
            "v" : "2.9.0",
            "vc" : "1604"
        ]
        Alamofire.request(EYEURL.URL_Selected, method: .get, parameters: parameters).responseJSON { response in
            if let value = response.result.value {
                let sectionList = Mapper<EYESelectedModel>().map(JSONObject: value)
                self.sectionList = (sectionList?.sectionList)!
                self.tableView.reloadData()
            }
        }
    }

    // MARK: --------------------- Getters and Setters ---------------------

}

// MARK: --------------------- TableViewDataSource / Delegate ---------------------

extension EYESelectedViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionList.count > 0 ? 1 : 0;
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

        switch sectionModel.type {
        case "feedSection":
            let cell = tableView.dequeueReusableCell(withIdentifier: EYEVideoBeanForClientTableViewCell.className) as! EYEVideoBeanForClientTableViewCell
            cell.itemModel = itemModel;
            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 获取模型
        let sectionModel = sectionList[indexPath.section]
        let itemModel: ItemModel = sectionModel.itemList![indexPath.row]

        switch itemModel.type {
        case "video":
            return EYEConstant.TableViewCellHeight_VideoBeanForClient
        default:
            return 0
        }
    }
}
