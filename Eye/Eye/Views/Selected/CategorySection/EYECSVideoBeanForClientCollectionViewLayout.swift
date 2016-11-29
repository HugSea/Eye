//
//  EYECSVideoBeanForClientCollectionViewLayout.swift
//  Eye
//
//  Created by Jack on 2016/11/29.
//  Copyright © 2016年 Zhang Qingjie. All rights reserved.
//

import UIKit

class EYECSVideoBeanForClientCollectionViewLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        self.scrollDirection = .horizontal
        self.collectionView?.decelerationRate = UIScrollViewDecelerationRateFast
    }

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        var offsetAdjustment = CGFloat(MAXFLOAT)
        let horizontalCenter = proposedContentOffset.x + collectionView!.bounds.width * 0.5
        let rect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView!.bounds.width, height: collectionView!.bounds.height)
        let array = super.layoutAttributesForElements(in: rect)
        for attributes in array! {
            let targetCenter = attributes.center.x
            if abs(targetCenter - horizontalCenter) < abs(offsetAdjustment) {
                offsetAdjustment = targetCenter - horizontalCenter
            }
        }
        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
    }

}
