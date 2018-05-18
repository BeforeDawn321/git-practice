//
//  TableViewController.swift
//  Comment
//
//  Created by yuting jiang on 2018/5/3.
//  Copyright © 2018年 yuting jiang. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class TableViewController: UIViewController, UITableViewDelegate {
    
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
    
    //=========
    let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1).cgColor
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "菜名"
        label.textColor = UIColor(red: 44/255, green: 44/255, blue: 44/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        //label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    let canteenLabel: UILabel = {
        let label = UILabel()
        label.text = "竹园餐厅（学四）二层1号窗口"
        label.textColor = UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    let tableView = UITableView(frame: CGRect(x: 0, y: 64, width: sWid, height: sHeight - 64))

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavBar()
        setTableView()
//        canteenLabel.addSubview(tableView)
    }
    
    func setTableView() {
        tableView.delegate = self
//        tableView.dataSource = self
        tableView.backgroundColor = bgColor
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableCells")
        self.view.addSubview(tableView)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCells")
//
//        cell?.backgroundColor = .clear
//        return cell!
        let fIndex = NSIndexPath(index: 2)
        let firstcell: UITableViewCell = tableView.mm_dequeueStaticCell(indexPath: fIndex)
        firstcell.backgroundColor = .black
        return firstcell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(topImgViewH)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headImgView = UIImageView(image: headImg)
        headImgView.sizeToFit()
        headImgView.frame = CGRect(x: 0, y: 0, width: sWid, height: topImgViewH)
        
        headImgView.addSubview(titleView)
//        tableView.bringSubview(toFront: titleView)
        titleView.snp.makeConstraints { (make) in
            make.width.equalTo(titleVIewW)//350
            make.height.equalTo(titleViewH) //70
            make.centerX.equalTo(headImgView)
            make.bottomMargin.equalTo(headImgView).offset(20)
        }
        
        headImgView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.height.equalTo(nameLabelH)//15
            make.leftMargin.equalTo(titleView).offset(sWid * 0.05) //20
            make.topMargin.equalTo(titleView).offset(sHeight * 0.02) //18
        }
        
        headImgView.addSubview(canteenLabel)
        canteenLabel.snp.makeConstraints { (make) in
            make.width.equalTo(sWid * 0.7)
            make.height.equalTo(sHeight * 0.02)//15
            make.leftMargin.equalTo(nameLabel)
            make.topMargin.equalTo(nameLabel).offset(25)
        }
        return headImgView
    }
    
    func setNavBar() {
        self.navigationController?.navigationBar.barTintColor = uiOrange
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 19)]
        navigationItem.title = "点评"
    }
}



class TableViewCell: UITableViewCell {
    
}






















