//
//  FFKeywordCellNode.swift
//  FindFriend
//
//  Created by coramo on 16/8/11.
//  Copyright © 2016年 mrdocan. All rights reserved.
//



import UIKit
import AsyncDisplayKit
import EZSwiftExtensions

class FFKeywordCellNode: ASCellNode, ASCollectionViewDelegateFlowLayout, ASCollectionDataSource {
    
    //MARK: -此类废弃 删除
    
    var headImage: ASNetworkImageNode = ASNetworkImageNode()
    var titleLabel: ASButtonNode = ASButtonNode()
    var subTitles: Array<ASLayoutable> = []
    var lineNode: ASDisplayNode = ASDisplayNode()
    var subTitleCollectionNode = ASCollectionNode()
    
    init( cellData: Dictionary<String, AnyObject> ) {
       super.init()
        self.selectionStyle = .None
        self.backgroundColor = UIColor.whiteColor()
        headImage.URL = NSURL(string: (cellData["image"] as! String))
        headImage.shouldRenderProgressImages = true
        addSubnode(headImage)
        titleLabel.setAttributedTitle((string: (cellData["title"] as! String).color(FFTheme.titleColor()).font(UIFont.systemFontOfSize(17.0))), forState: .Normal)
        titleLabel.contentEdgeInsets = UIEdgeInsetsMake(5, 8, 5, 8)
        addSubnode(titleLabel)
        
        for subtitle in (cellData["subTitles"] as! NSArray) {
            let subTitleLabel = ASButtonNode()
            subTitleLabel.setAttributedTitle((string: (subtitle as! String).color(UIColor.whiteColor()).font(UIFont.systemFontOfSize(13.0))), forState: .Normal)
            subTitleLabel.backgroundColor = FFTheme.randomBeautyColor()
            subTitleLabel.contentEdgeInsets = UIEdgeInsetsMake(5, 8, 5, 8)
            subTitleLabel.cornerRadius = 3.0
            addSubnode(subTitleLabel)
            subTitles.append(subTitleLabel)
        }
        
        subTitleCollectionNode.delegate = self
        subTitleCollectionNode.dataSource = self
        addSubnode(subTitleCollectionNode)
        subTitleCollectionNode.reloadData()
        
        lineNode.backgroundColor = FFTheme.borderColor()
        lineNode.bounds = CGRectMake(0, 0, self.view.size.width, FFTheme.onePixel())
        addSubnode(lineNode)
    }
    
    override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        let subTitleStackLayoutSpec = ASStackLayoutSpec()
//        subTitleStackLayoutSpec.direction = .Horizontal
//        subTitleStackLayoutSpec.spacing = 5.0
//        subTitleStackLayoutSpec.baselineRelativeArrangement = true
//        subTitleStackLayoutSpec.setChildren(subTitles)
        
        
        let stackLayoutSpec: ASStackLayoutSpec = ASStackLayoutSpec()
        stackLayoutSpec.direction = .Vertical
        stackLayoutSpec.spacing = 4.0
        stackLayoutSpec.setChildren([titleLabel, subTitleCollectionNode])
        
        headImage.preferredFrameSize = CGSizeMake(60, 60)
        
        let headImageStackLayoutSpec: ASStackLayoutSpec = ASStackLayoutSpec()
        headImageStackLayoutSpec.direction = .Horizontal
        headImageStackLayoutSpec.spacing = 5.0
        headImageStackLayoutSpec.setChildren([headImage, stackLayoutSpec])
        let insetSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(8, 8, 8, 8), child: headImageStackLayoutSpec);
        
        lineNode.preferredFrameSize = CGSizeMake(constrainedSize.max.width, FFTheme.onePixel())
        let lastStackLayoutSpec: ASStackLayoutSpec = ASStackLayoutSpec()
        lastStackLayoutSpec.direction = .Vertical
        lastStackLayoutSpec.spacing = 1.0
        lastStackLayoutSpec.setChildren([insetSpec, lineNode])
        return lastStackLayoutSpec;
    }
    
    
    //ASCollectionDataSource and ASCollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subTitles.count
    }
    
    func collectionView(collectionView: ASCollectionView, nodeBlockForItemAtIndexPath indexPath: NSIndexPath) -> ASCellNodeBlock {
        return{
            return ASCellNode()
        }
    }
    
    func collectionView(collectionView: ASCollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }
}
