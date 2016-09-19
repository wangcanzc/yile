//
//  FFExtension.swift
//  FindFriend
//
//  Created by coramo on 16/8/10.
//  Copyright © 2016年 mrdocan. All rights reserved.
//

import Foundation
import UIKit
import EZSwiftExtensions


extension NSLayoutConstraint{
    var nibOnePixel: Bool {
        get {
            return true;
        }
        set {
            self.constant = 1 / UIScreen.mainScreen().scale
        }
    }
}

extension UIImage {
     static func image(color: UIColor) -> UIImage{
        let rect: CGRect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension NSAttributedString {
    func font(font: UIFont) -> NSAttributedString {
        let mutableAttributedString = self as! NSMutableAttributedString
        mutableAttributedString.addAttribute(NSFontAttributeName, value:font, range: NSMakeRange(0, self.length))
        return mutableAttributedString
    }
}

extension NSString {
    public func height(width: CGFloat, fontSize: CGFloat) -> CGFloat {
        return self.boundingRectWithSize(CGSizeMake(width, CGFloat.max), options: NSStringDrawingOptions(rawValue: NSStringDrawingOptions.UsesLineFragmentOrigin.rawValue | NSStringDrawingOptions.UsesFontLeading.rawValue) , attributes: [NSFontAttributeName: UIFont.systemFontOfSize(fontSize)], context: nil).size.height
    }
    public func width(height: CGFloat, fontSize: CGFloat) -> CGFloat {
        return self.boundingRectWithSize(CGSizeMake(CGFloat.max, height), options: NSStringDrawingOptions(rawValue: NSStringDrawingOptions.UsesLineFragmentOrigin.rawValue | NSStringDrawingOptions.UsesFontLeading.rawValue) , attributes: [NSFontAttributeName: UIFont.systemFontOfSize(fontSize)], context: nil).size.width
    }
}

extension UIView {
    
    //MARK: - load
    public class func loadFromNib(nibNameOrNil: String? = nil) -> Self {
        return loadFromNib(nibNameOrNil, type: self)
    }
    
    public class func loadFromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T {
        let v: T? = loadFromNib(nibNameOrNil, type: T.self)
        return v!
    }
    
    public class func loadFromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T? {
        var view: T?
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            name = nibName
        }
        let nibViews = NSBundle.mainBundle().loadNibNamed(name, owner: nil, options: nil)
        for v in nibViews {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }
    
    public class var nibName: String {
        let name = "\(self)".componentsSeparatedByString(".").first ?? ""
        return name
    }
    public class var nib: UINib? {
        if let _ = NSBundle.mainBundle().pathForResource(nibName, ofType: "nib") {
            return UINib(nibName: nibName, bundle: nil)
        } else {
            return nil
        }
    }
}