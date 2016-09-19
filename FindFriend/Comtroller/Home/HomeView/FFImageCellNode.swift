//
//  FFImageCellNode.swift
//  FindFriend
//
//  Created by coramo on 16/8/12.
//  Copyright © 2016年 mrdocan. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class FFImageCellNode: ASCellNode {
    
    //MARK: -此类废弃 删除
    
    var imageNode: ASButtonNode = ASButtonNode()
    
    init( image: UIImage){
        super.init()
        imageNode.setImage(image, forState: .Normal)
        addSubnode(imageNode)
    }
    
    convenience init(image: UIImage ,backgroundColor: UIColor) {
        self.init(image: image)
        self.backgroundColor = backgroundColor
    }
    
    init(title: String , titleFontSize: CGFloat, titleColor: UIColor, backgroundColor: UIColor) {
        super.init()
        imageNode.setTitle(title, withFont: UIFont.systemFontOfSize(titleFontSize), withColor: titleColor, forState: ASControlState.Normal)
        self.backgroundColor = backgroundColor
    }

    override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stackLayoutSpec: ASStackLayoutSpec = ASStackLayoutSpec()
        stackLayoutSpec.direction = .Vertical
        stackLayoutSpec.horizontalAlignment = .HorizontalAlignmentMiddle
        stackLayoutSpec.setChildren([imageNode])
        let insetLayoutSpec: ASInsetLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(8, 8, 8, 8), child: stackLayoutSpec)
        return insetLayoutSpec
    }
}
