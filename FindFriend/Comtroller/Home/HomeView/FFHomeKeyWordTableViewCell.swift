//
//  FFKeyWordTableViewCell.swift
//  FindFriend
//
//  Created by coramo on 16/9/1.
//  Copyright © 2016年 mrdocan. All rights reserved.
//

import UIKit
import Kingfisher


class FFHomeKeyWordTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var headImage: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var lineHeightLayout: NSLayoutConstraint!
    var imageUrlString = "" {
        didSet {
            if imageUrlString.length > 0 {
                print(imageUrlString)
                headImage.kf_setImageWithURL(NSURL(string: imageUrlString)!)
            }
        }
    }
    var title = "" {
        didSet {
            titleLabel.text = title
        }
    }
    var tagDataArray : Array<String> = Array(){
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lineView.backgroundColor = FFTheme.borderColor()
        lineHeightLayout.constant = FFTheme.onePixel()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        for cellString in ["FFHomeKeyWordTagCollectionViewCell"] {
            collectionView.registerNib(UINib.init(nibName: cellString, bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: cellString)
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagDataArray.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FFHomeKeyWordTagCollectionViewCell", forIndexPath: indexPath) as! FFHomeKeyWordTagCollectionViewCell
        cell.titleLabel.text = tagDataArray[indexPath.row]
        cell.boxView.backgroundColor = FFTheme.randomBeautyColor()
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return FFHomeKeyWordTagCollectionViewCell.cellSize(tagDataArray[indexPath.row], fontSize: 15.0, height: 32.0)
    }
    
    static func cellHeight( dataArray: Array<String>, superWith: CGFloat) -> CGFloat {
        var maxWidth: CGFloat = 0.0
        for dataString in dataArray {
            maxWidth += FFHomeKeyWordTagCollectionViewCell.cellSize(dataString, fontSize: 15.0, height: 32.0).width
            if maxWidth > superWith - 88 {
                return 112.0
            }
        }
        return 80.0
    }
    
}
