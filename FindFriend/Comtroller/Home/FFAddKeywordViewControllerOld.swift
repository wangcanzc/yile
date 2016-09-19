//
//  FFAddKeywordViewController.swift
//  FindFriend
//
//  Created by coramo on 16/8/12.
//  Copyright © 2016年 mrdocan. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class FFAddKeywordViewControllerOld: ASViewController, ASTableDataSource, ASTableDelegate{
    //MARK: -此类废弃 删除
    var data: NSArray = []
    
    let tableNode: ASTableNode = ASTableNode(style: .Plain)
    let keywordInputView: UITextField = UITextField()
    
    
    
    init() {
        super.init(node: tableNode)
        tableNode.dataSource = self
        tableNode.delegate = self
        tableNode.view.separatorStyle = .None
        tableNode.backgroundColor = FFTheme.backgroundColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationView()
    }
    
    func setupNavigationView() {
        let rightBarButtonItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: #selector(FFAddKeywordViewControllerOld.backView))
        rightBarButtonItem.tintColor = UIColor.whiteColor()
        self.navigationItem.rightBarButtonItems = [rightBarButtonItem]
        self.navigationItem.leftBarButtonItems = []
        
        let titleView = UIView()
        titleView.frame = CGRectMake(0, 0, self.view.size.width - 50.0, 30)
        titleView.backgroundColor = FFTheme.backgroundColor()
        titleView.layer.masksToBounds = true
        titleView.layer.borderColor = FFTheme.borderColor().CGColor
        titleView.layer.borderWidth = FFTheme.onePixel()
        titleView.layer.cornerRadius = 5.0
        keywordInputView.placeholder = "请输入添加的兴趣"
        keywordInputView.borderStyle = .None
        keywordInputView.font = UIFont.systemFontOfSize(15.0)
        keywordInputView.size = CGSizeMake(titleView.size.width - 6, titleView.size.height)
        keywordInputView.center = titleView.center
        keywordInputView.addTarget(self, action: #selector(FFAddKeywordViewControllerOld.keywordInputViewDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
        titleView.addSubview(keywordInputView)
        self.navigationItem.titleView = titleView
        
        keywordInputView.becomeFirstResponder()
    }
    
    func backView() {
        dismissViewControllerAnimated(false, completion: {})
    }
    
    // MARK: - ASTableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count + 1
    }
    
    func tableView(tableView: ASTableView, nodeBlockForRowAtIndexPath indexPath: NSIndexPath) -> ASCellNodeBlock {
        if ( indexPath.row == 0 ){
            return{
                return FFImageCellNode(title: "自定义兴趣", titleFontSize: 17.0, titleColor: UIColor.blackColor() ,backgroundColor: UIColor(hexString: "0xAAAAAA", alpha: 0.3)!)
            }
        } else {
            return {
                let keywordCellNode: FFKeywordCellNode = FFKeywordCellNode(cellData: self.data[indexPath.row] as! Dictionary)
                return keywordCellNode
            }
        }
    }
    
    func keywordInputViewDidChange(textField: UITextField) {
        if textField.text?.length == 0 {
            self.data = []
        } else if textField.text?.length == 1 {
            self.data = [["title": "英雄联盟","image":"http://img3.imgtn.bdimg.com/it/u=584914403,2757473800&fm=21&gp=0.jpg","subTitles": ["LOL", "网络游戏", "多人作战", "腾讯代理", "人在塔在"]]]
        } else if textField.text?.length == 2 {
            self.data = [["title": "英雄联盟","image":"http://img3.imgtn.bdimg.com/it/u=584914403,2757473800&fm=21&gp=0.jpg","subTitles": ["LOL", "网络游戏", "多人作战", "腾讯代理", "人在塔在"]], ["title": "守望先锋","image":"http://img3.imgtn.bdimg.com/it/u=584914403,2757473800&fm=21&gp=0.jpg","subTitles": ["屁股先锋", "暴雪制作", "盲人先锋"]]]
        } else if textField.text?.length == 3 {
            self.data = [["title": "英雄联盟","image":"http://img3.imgtn.bdimg.com/it/u=584914403,2757473800&fm=21&gp=0.jpg","subTitles": ["LOL", "网络游戏", "多人作战", "腾讯代理", "人在塔在"]], ["title": "守望先锋","image":"http://img3.imgtn.bdimg.com/it/u=584914403,2757473800&fm=21&gp=0.jpg","subTitles": ["屁股先锋", "暴雪制作", "盲人先锋"]], ["title": "DOTA2","image":"http://img3.imgtn.bdimg.com/it/u=584914403,2757473800&fm=21&gp=0.jpg","subTitles": ["刀塔", "V社运营", "多人对抗RPG"]]]
        } else if textField.text?.length >= 4 {
            self.data = [["title": "英雄联盟","image":"http://img3.imgtn.bdimg.com/it/u=584914403,2757473800&fm=21&gp=0.jpg","subTitles": ["LOL", "网络游戏", "多人作战", "腾讯代理", "人在塔在"]], ["title": "守望先锋","image":"http://img3.imgtn.bdimg.com/it/u=584914403,2757473800&fm=21&gp=0.jpg","subTitles": ["屁股先锋", "暴雪制作", "盲人先锋"]], ["title": "DOTA2","image":"http://img3.imgtn.bdimg.com/it/u=584914403,2757473800&fm=21&gp=0.jpg","subTitles": ["刀塔", "V社运营", "多人对抗RPG"]], ["title": "穿越火线", "image":"http://img3.imgtn.bdimg.com/it/u=584914403,2757473800&fm=21&gp=0.jpg", "subTitles": ["CF", "多人作战", "腾讯出品", "射击游戏"]]]
        }
        self.tableNode.view.reloadData()
    }
}
