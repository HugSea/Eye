//
//  EYEItemCollectionTableViewCell.swift
//  Eye
//
//  Created by Jack on 2016/11/25.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import UIKit

class EYEItemCollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var picBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.register(UINib(nibName: EYEVideoBeanForClientCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: EYEVideoBeanForClientCollectionViewCell.className)
        collectionView.register(UINib(nibName: EYEActionCardCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: EYEActionCardCollectionViewCell.className)
    }

    var itemModel: ItemModel! {
        didSet {
            picBtn.kf.setImage(with: URL(string: itemModel.cover!), for: .normal)
            collectionView.reloadData()
        }
    }
    
}

extension EYEItemCollectionTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (itemModel.itemList?.count)!
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemModel: ItemModel = self.itemModel.itemList![indexPath.row]
        switch itemModel.dataType {
        case "VideoBeanForClient":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EYEVideoBeanForClientCollectionViewCell.className, for: indexPath) as! EYEVideoBeanForClientCollectionViewCell
            cell.itemModel = itemModel
            return cell
        case "ActionCard":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EYEActionCardCollectionViewCell.className, for: indexPath) as! EYEActionCardCollectionViewCell
            cell.title = itemModel.text
            return cell
        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemModel: ItemModel = self.itemModel.itemList![indexPath.row]
        switch itemModel.dataType {
        case "VideoBeanForClient":
            return EYEConstant.CollectionViewCellSize_VideoBeanForClient
        case "ActionCard":
            return EYEConstant.CollectionViewCellSize_ActionCard
        default:
            return CGSize.zero
        }
    }
}
