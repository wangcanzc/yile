//
//  FFLoginViewController.swift
//  FindFriend
//
//  Created by coramo on 16/8/10.
//  Copyright © 2016年 mrdocan. All rights reserved.
//

import UIKit

class FFLoginViewController: UIViewController {

    @IBOutlet weak var loginButtonBoxView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        
        self.navigationController?.navigationBarHidden = true
        
        loginButtonBoxView.layer.masksToBounds = true
        loginButtonBoxView.layer.cornerRadius = 3.0
    }
    @IBAction func Login(sender: AnyObject) {
        User.shareUser.isLogin = true
        UIApplication.sharedApplication().delegate?.window??.rootViewController = FFBaseTabbarController()
    }
    @IBAction func register(sender: AnyObject) {
        pushVC(FFRegisterViewController())
    }
    @IBAction func forgotPassword(sender: AnyObject) {
        pushVC(FFForgotPasswordViewController())
    }
}
