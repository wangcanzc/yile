//
//  User.swift
//  FindFriend
//
//  Created by coramo on 16/8/10.
//  Copyright © 2016年 mrdocan. All rights reserved.
//

import UIKit

final class User: NSObject {
    static let shareUser = User()
    
    override init() {
        let isLoginValue = NSUserDefaults.standardUserDefaults().objectForKey(FFConstant.userLoginStatusKey)
        if isLoginValue != nil && (isLoginValue as? Bool)! && (isLoginValue?.boolValue)! {
            self.isLogin = true
        } else {
            self.isLogin = false
        }
    }
    
    var isLogin :Bool  {
        didSet {
            if self.isLogin {
                NSUserDefaults.standardUserDefaults().setObject(true, forKey: FFConstant.userLoginStatusKey)
            } else {
                NSUserDefaults.standardUserDefaults().setObject(false, forKey: FFConstant.userLoginStatusKey)
            }
        }
    }
}
