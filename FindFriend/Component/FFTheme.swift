//
//  FFTheme.swift
//  FindFriend
//
//  Created by coramo on 16/8/10.
//  Copyright © 2016年 mrdocan. All rights reserved.
//

import UIKit
import EZSwiftExtensions

class FFTheme: NSObject {
    
    /*
     * color
     */
    
    static func mainColor() -> UIColor {
        return UIColor(hexString: "0x0080FF")!
    }
    
    static func titleColor() -> UIColor {
        return UIColor(hexString: "0x333333")!
    }
    
    static func subTitleColor() -> UIColor {
        return UIColor(hexString: "0xD3D3D3")!
    }
    
    static func tabbarColor() -> UIColor {
        return UIColor(hexString: "0xFFFFFF")!
    }
    
    static func backgroundColor() -> UIColor {
        return UIColor(hexString: "0xF3F3F3")!
    }
    
    static func borderColor() -> UIColor {
        return UIColor(hexString: "0xD7D7D7")!
    }
    
    static func randomBeautyColor() -> UIColor {
        return UIColor(hexString: (["0xFF7F00" ,"0xFF6666" ,"0xFF0080" ,"0xFF66FF" ,"0x66CCFF" ,"0x0080FF" ,"0xFF6FCF" ,"0xCC66FF" ,"0x66FF66" ,"0x800000"][NSNumber(unsignedInt: arc4random() % 10 ).integerValue]))!
        
        
    }
    
    /*
     * width
     */
    
    static func onePixel() -> CGFloat{
        return 1 / UIScreen.mainScreen().scale
    }
}
