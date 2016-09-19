//
//  FFRegisterViewController.swift
//  FindFriend
//
//  Created by coramo on 16/8/10.
//  Copyright © 2016年 mrdocan. All rights reserved.
//

import UIKit

class FFRegisterViewController: UIViewController {

    @IBOutlet weak var loginButtonBoxView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        loginButtonBoxView.layer.masksToBounds = true
        loginButtonBoxView.layer.cornerRadius = 3.0
    }
    @IBAction func sendMessage(sender: AnyObject) {
    }
    @IBAction func registerLogin(sender: AnyObject) {
    }
    @IBAction func back(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
