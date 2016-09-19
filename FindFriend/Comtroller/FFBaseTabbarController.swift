//
//  FFBaseTabbarController.swift
//  FindFriend
//
//  Created by coramo on 16/8/10.
//  Copyright © 2016年 mrdocan. All rights reserved.
//

import UIKit

class FFBaseTabbarController: UITabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tabBar.backgroundImage = UIImage.image(FFTheme.tabbarColor())
        self.tabBar.tintColor = FFTheme.mainColor()
        
        let homeNav = FFBaesNavigationController(rootViewController: FFHomeViewController())
        homeNav.tabBarItem = UITabBarItem(title: "首页", image: UIImage(named: "tabbar_home"), selectedImage: UIImage(named: "tabbar_home"))
        
        let messageNav = FFBaesNavigationController(rootViewController: FFMessageViewController())
        messageNav.tabBarItem = UITabBarItem(title: "消息", image: UIImage(named: "tabbar_message"), selectedImage: UIImage(named: "tabbar_message"))
        
        let myNav = FFBaesNavigationController(rootViewController: FFMyViewController())
        myNav.tabBarItem = UITabBarItem(title: "我的", image: UIImage(named: "tabbar_my"), selectedImage: UIImage(named: "tabbar_my"))
        
        self.viewControllers = [homeNav, messageNav, myNav]
    }
}
