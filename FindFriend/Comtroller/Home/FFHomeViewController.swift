//
//  FFHomeViewController.swift
//  FindFriend
//
//  Created by coramo on 16/9/1.
//  Copyright © 2016年 mrdocan. All rights reserved.
//

import UIKit

class FFHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var data: NSArray = [["title": "英雄联盟","image":"http://ww4.sinaimg.cn/mw690/006ivP1Fjw1f7rah9ardrj30640640sq.jpg","subTitles": ["LOL", "网络游戏", "多人作战", "腾讯代理", "人在塔在", "守望先锋"]], ["title": "守望先锋","image":"http://ww4.sinaimg.cn/mw690/006ivP1Fjw1f7rah9ardrj30640640sq.jpg","subTitles": ["屁股先锋", "暴雪制作", "盲人先锋"]], ["title": "DOTA2","image":"http://ww4.sinaimg.cn/mw690/006ivP1Fjw1f7rah9ardrj30640640sq.jpg","subTitles": ["刀塔", "V社运营", "多人对抗RPG"]], ["title": "穿越火线", "image":"http://ww4.sinaimg.cn/mw690/006ivP1Fjw1f7rah9ardrj30640640sq.jpg", "subTitles": ["CF", "多人作战", "腾讯出品", "射击游戏"]]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        setupData()
    }
    
    func setupView() {
        self.navigationItem.title = "首页"
    }
    
    func setupTableView() {
        for cellString in ["FFHomeKeyWordTableViewCell"] {
            tableView.registerNib(UINib.init(nibName: cellString, bundle: NSBundle.mainBundle()), forCellReuseIdentifier: cellString)
        }
    }
    
    func setupData() {
        
    }
    
    //MARK: - table view data source and table view delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FFHomeKeyWordTableViewCell", forIndexPath: indexPath) as! FFHomeKeyWordTableViewCell
        
        let cellData = data[indexPath.row] as! Dictionary<String, AnyObject>
        cell.imageUrlString = cellData["image"] as! String
        cell.title = cellData["title"] as! String
        cell.tagDataArray = cellData["subTitles"] as! Array<String>
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cellData = data[indexPath.row] as! Dictionary<String, AnyObject>
        return FFHomeKeyWordTableViewCell.cellHeight((cellData["subTitles"] as! Array), superWith: view.size.width)
    }
}
