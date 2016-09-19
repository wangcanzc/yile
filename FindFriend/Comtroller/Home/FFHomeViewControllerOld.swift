//
//  FFHomeViewController.swift
//  FindFriend
//
//  Created by coramo on 16/8/10.
//  Copyright © 2016年 mrdocan. All rights reserved.
//

import UIKit
import CoreLocation
import AsyncDisplayKit

class FFHomeViewControllerOld: ASViewController, ASTableDataSource, ASTableDelegate {
    //MARK: -此类废弃 删除
    let tableNode: ASTableNode = ASTableNode(style: .Plain)
    
    var data: NSArray = [["title": "英雄联盟","image":"http://img3.imgtn.bdimg.com/it/u=584914403,2757473800&fm=21&gp=0.jpg","subTitles": ["LOL", "网络游戏", "多人作战", "腾讯代理", "人在塔在", "守望先锋"]], ["title": "守望先锋","image":"http://img3.imgtn.bdimg.com/it/u=584914403,2757473800&fm=21&gp=0.jpg","subTitles": ["屁股先锋", "暴雪制作", "盲人先锋"]], ["title": "DOTA2","image":"http://img3.imgtn.bdimg.com/it/u=584914403,2757473800&fm=21&gp=0.jpg","subTitles": ["刀塔", "V社运营", "多人对抗RPG"]], ["title": "穿越火线", "image":"http://img3.imgtn.bdimg.com/it/u=584914403,2757473800&fm=21&gp=0.jpg", "subTitles": ["CF", "多人作战", "腾讯出品", "射击游戏"]]]
    
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
        tableNode.view.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        setupView()
        setupData()
        self.view.addSubnode(self.tableNode)
    }
    
    func setupView() {
        self.navigationItem.title = "首页"
    }
    
    func setupData() {
    }
    
    // MARK: - ASTableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data.count < 5 {
            return data.count + 1
        } else {
            return data.count
        }
    }
    
    func tableView(tableView: ASTableView, nodeBlockForRowAtIndexPath indexPath: NSIndexPath) -> ASCellNodeBlock {
        if data.count < 5 && data.count == indexPath.row {
            return{
                return FFImageCellNode(image: UIImage(named: "home_keyword_add")!, backgroundColor: UIColor(hexString: "0xAAAAAA", alpha: 0.3)!)
            }
        }
        return {
            let keywordCellNode: FFKeywordCellNode = FFKeywordCellNode(cellData: self.data[indexPath.row] as! Dictionary)
            return keywordCellNode
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == data.count {
            dispatch_async(dispatch_get_main_queue(), { 
              self.presentViewController(FFBaesNavigationController(rootViewController: FFAddKeywordViewControllerOld()), animated: false, completion: {})
            })
        }
    }
}
