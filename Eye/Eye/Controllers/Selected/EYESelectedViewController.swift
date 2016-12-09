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
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    var sectionList: [SectionModel] = [SectionModel]()
    var isShowActivityView = true;

    // MARK: --------------------- Life Cycle ---------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        requestData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.statusBarStyle = .lightContent
    }

    // MARK: --------------------- Private Methods ---------------------
    private func setupUI() {
        let tableHeaderView = UIButton(type: .custom)
        tableHeaderView.frame = CGRect(x: 0, y: 0, width: EYEConstant.ScreenWidth, height:214)
        tableView.tableHeaderView = tableHeaderView
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0)
        // 注册TableViewCell
        tableView.register(UINib(nibName: EYEVideoBeanForClientTableViewCell.className, bundle: nil), forCellReuseIdentifier: EYEVideoBeanForClientTableViewCell.className)
        tableView.register(UINib(nibName: EYETextHeaderTableViewCell.className, bundle: nil), forCellReuseIdentifier: EYETextHeaderTableViewCell.className)
        tableView.register(UINib(nibName: EYESelectedFooterTableViewCell.className, bundle: nil), forCellReuseIdentifier: EYESelectedFooterTableViewCell.className)
        tableView.register(UINib(nibName: EYEItemCollectionTableViewCell.className, bundle: nil), forCellReuseIdentifier: EYEItemCollectionTableViewCell.className)
        tableView.register(UINib(nibName: EYEVideoCollectionOfHorizontalScrollCardTableViewCell.className, bundle: nil), forCellReuseIdentifier: EYEVideoCollectionOfHorizontalScrollCardTableViewCell.className)

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
                for sectionModel: SectionModel in self.sectionList {
                    let itemModel: ItemModel = sectionModel.itemList![0]
                    print(itemModel.actionUrl)
                }
                self.activityView.isHidden = true
                self.tableView.reloadData()
            }
        }
    }
    
    fileprivate func pullRefreshWithContentOffsetY(contentOffsetY y: CGFloat) {
        if y < 0 && self.activityView.isHidden == true {
            let maxY = max(-45, y)
            self.dateLabel.alpha = (maxY + 45) / 45.0
            if maxY == -45 && self.isShowActivityView == true {
                self.activityView.isHidden = false
                self.isShowActivityView = false
                self.requestData()
            }
        }
    }

    // MARK: --------------------- Getters and Setters ---------------------

}

// MARK: --------------------- TableViewDataSource / Delegate ---------------------

extension EYESelectedViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionList.count;
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
                cell.isShowSubviews(true)
                cell.content = footerModel.text
                return cell
            case "blankFooter":
                let cell = tableView.dequeueReusableCell(withIdentifier: EYESelectedFooterTableViewCell.className) as! EYESelectedFooterTableViewCell
                cell.contentViewHeightConstraint.constant = 0
                cell.contentLabel.isHidden = true
                cell.isShowSubviews(false)
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
        case "lightTopicSection":
            let cell = tableView.dequeueReusableCell(withIdentifier: EYEItemCollectionTableViewCell.className) as! EYEItemCollectionTableViewCell
            cell.itemModel = itemModel
            return cell
        case "categorySection":
            let cell = tableView.dequeueReusableCell(withIdentifier: EYEVideoCollectionOfHorizontalScrollCardTableViewCell.className) as! EYEVideoCollectionOfHorizontalScrollCardTableViewCell
            cell.itemModel = itemModel
            return cell
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
        switch sectionModel.type {
        case "feedSection":
            if itemModel.type == "video" {
                return EYEConstant.TableViewCellHeight_VideoBeanForClient
            } else if itemModel.type == "textHeader" {
                return EYEConstant.TableViewCellHeight_TextHeader
            } else {
                return 0
            }
        case "lightTopicSection":
            return EYEConstant.TableViewCellHeight_ItemCollection
        case "categorySection":
            return EYEConstant.TableViewCellHeight_VideoCollectionOfHorizontalScrollCard
        default:
            return 0
        }
    }
}
// MARK: --------------------- UIScrollViewDelegate ---------------------
extension EYESelectedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 下拉刷新
        self.pullRefreshWithContentOffsetY(contentOffsetY: scrollView.contentOffset.y)
        if scrollView.contentOffset.y >= 0 {
            self.isShowActivityView = true
        }
        // 顶部视图动画
        if scrollView.contentOffset.y < 0 {
            topViewHeightConstraint.constant = 214 + fabs(scrollView.contentOffset.y)
        }
    }
}
