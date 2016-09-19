//
//  FFHomeKeyWordTagCollectionViewCell.swift
//  FindFriend
//
//  Created by coramo on 16/9/1.
//  Copyright © 2016年 mrdocan. All rights reserved.
//

import UIKit

class FFHomeKeyWordTagCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        boxView.layer.cornerRadius = 3.0
        boxView.layer.masksToBounds = true
    }
    
    static func cellSize(title: String ,fontSize: CGFloat, height: CGFloat) -> CGSize {
        return CGSizeMake((title as NSString).width(fontSize, fontSize: fontSize) + 16, height)
    }
}
