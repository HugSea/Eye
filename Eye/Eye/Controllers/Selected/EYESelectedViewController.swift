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
        // 注册TableViewCell
        tableView.register(UINib(nibName: EYEVideoBeanForClientTableViewCell.className, bundle: nil), forCellReuseIdentifier: EYEVideoBeanForClientTableViewCell.className)
        tableView.register(UINib(nibName: EYETextHeaderTableViewCell.className, bundle: nil), forCellReuseIdentifier: EYETextHeaderTableViewCell.className)
        tableView.register(UINib(nibName: EYESelectedFooterTableViewCell.className, bundle: nil), forCellReuseIdentifier: EYESelectedFooterTableViewCell.className)

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
        let itemList = sectionModel.itemList!
        return itemList.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 获取模型
        let sectionModel = sectionList[indexPath.section]

        // Footer
        if indexPath.row == (sectionModel.itemList?.count)! {
            let footerModel: FooterModel = sectionModel.footer
            switch footerModel.type {
            case "forwardFooter":
                let cell = tableView.dequeueReusableCell(withIdentifier: EYESelectedFooterTableViewCell.className) as! EYESelectedFooterTableViewCell
                cell.contentViewHeightConstraint.constant = 60.0
                cell.content = footerModel.text
                return cell
            case "blankFooter":
                let cell = tableView.dequeueReusableCell(withIdentifier: EYESelectedFooterTableViewCell.className) as! EYESelectedFooterTableViewCell
                cell.contentViewHeightConstraint.constant = 0
                return cell
            default:
                return UITableViewCell()
            }
        }

        let itemModel: ItemModel = sectionModel.itemList![indexPath.row]
        switch sectionModel.type {
        case "feedSection":
            if itemModel.type == "video" {
                let cell = tableView.dequeueReusableCell(withIdentifier: EYEVideoBeanForClientTableViewCell.className) as! EYEVideoBeanForClientTableViewCell
                cell.itemModel = itemModel;
                return cell
            } else if itemModel.type == "textHeader" {
                let cell = tableView.dequeueReusableCell(withIdentifier: EYETextHeaderTableViewCell.className) as! EYETextHeaderTableViewCell
                cell.title = itemModel.text
                return cell
            } else {
                return UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 获取模型
        let sectionModel = sectionList[indexPath.section]

        // Footer
        if indexPath.row == (sectionModel.itemList?.count)! {
            let footer: FooterModel = sectionModel.footer
            switch footer.type {
            case "forwardFooter":
                return EYEConstant.TableViewCellHeight_ForwardFooter
            case "blankFooter":
                return EYEConstant.TableViewCellHeight_BlankFooter
            default:
                return 0
            }
        }

        let itemModel: ItemModel = sectionModel.itemList![indexPath.row]
        switch itemModel.type {
        case "video":
            return EYEConstant.TableViewCellHeight_VideoBeanForClient
        case "textHeader":
            return EYEConstant.TableViewCellHeight_TextHeader
        default:
            return 0
        }
    }
}
