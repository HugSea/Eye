//
//  EYEVideoCollectionOfHorizontalScrollCardTableViewCell.swift
//  Eye
//
//  Created by Jack on 2016/11/29.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import UIKit

let kCollectionViewMaxSection = 1000

class EYEVideoCollectionOfHorizontalScrollCardTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let layout = EYECSVideoBeanForClientCollectionViewLayout()
        layout.itemSize = EYEConstant.CollectionViewCellSize_CSVideoBeanForClient
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsetsMake(0, 2.5, 0, 2.5)
        collectionView.setCollectionViewLayout(layout, animated: false)

        collectionView.register(UINib(nibName: EYECSVideoBeanForClientCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: EYECSVideoBeanForClientCollectionViewCell.className)
    }

    var itemModel: ItemModel! {
        didSet {
            titleLabel.text = itemModel.hTitle
            subTitleLabel.text = itemModel.hSubTitle
            pageControl.numberOfPages = (itemModel.itemList?.count)!
            collectionView.scrollToItem(at: IndexPath(item: 0, section: kCollectionViewMaxSection / 2), at: .centeredHorizontally, animated: false)
            collectionView.reloadData()
        }
    }
}

// MARK: --------------------- UICollectionViewDataSource / Delegate ---------------------
extension EYEVideoCollectionOfHorizontalScrollCardTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return kCollectionViewMaxSection
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemModel.itemList!.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model: ItemModel = self.itemModel.itemList![indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EYECSVideoBeanForClientCollectionViewCell.className, for: indexPath) as! EYECSVideoBeanForClientCollectionViewCell
        cell.itemModel = model
        return cell
    }
}

// MARK: --------------------- UIScrollViewDelegate ---------------------
extension EYEVideoCollectionOfHorizontalScrollCardTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int((scrollView.contentOffset.x + EYEConstant.CollectionViewCellSize_CSVideoBeanForClient.width * 0.5) / EYEConstant.CollectionViewCellSize_CSVideoBeanForClient.width) % itemModel.itemList!.count
        pageControl.currentPage = page
    }
}

