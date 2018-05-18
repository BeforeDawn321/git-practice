//
//  CollectionViewController.swift
//  Comment
//
//  Created by yuting jiang on 2018/5/2.
//  Copyright © 2018年 yuting jiang. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let scrollView = UIScrollView()
    let labels: [UILabel] = []
    var mealButtons: [UIButton] = []
    var commentButtons: [UIButton] = []
    
    let topImgViewH = sHeight * 0.2
    let titleViewH = sHeight * 0.1
    let titleVIewW = sWid * 0.85
    let nameLabelH = sHeight * 0.02
    let labelsW = sWid * 0.17
    let labelsH = sHeight * 23 / 736
    let labelVerOffset = sHeight * 43 / 736
    let commentButtonsH = sHeight * 23 / 736
    let mealButtonsH = sHeight * 23 / 736
    let mealButtonsW = sWid * 64 / 414
    let picButtonW = Int((sWid * 0.85 - 20) / 3)
    let criticalTextFieldH = sHeight * 165 / 736
    
    var comButsWid = 0
    var offset = 0.0
    var contentH = 0.0
    
    var headImg = #imageLiteral(resourceName: "dish")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setCollectionView()
    }
    
    func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.itemSize = CGSize(width: sWid, height: sHeight)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 64, width: sWid, height: sHeight - 64), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = bgColor
        collectionView.alwaysBounceVertical = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cells")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView")
        
        
        self.view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cells", for: indexPath)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: sWid, height: topImgViewH)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView", for: indexPath)
        headView.backgroundColor = .green
        let headImgView = UIImageView(image: headImg)
        headImgView.sizeToFit()
        headImgView.frame = CGRect(x: 0, y: 0, width: sWid, height: topImgViewH)
        headView.addSubview(headImgView)
        
        return headView
    }
    
    func setNavBar() {
        self.navigationController?.navigationBar.barTintColor = uiOrange
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 19)]
        navigationItem.title = "点评"
    }
}


class CollectionViewCell: UICollectionViewCell {
    
}









