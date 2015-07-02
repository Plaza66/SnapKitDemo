//
//  DemoViewController.swift
//  SwiftDemo
//
//  Created by liyan on 15/7/1.
//  Copyright (c) 2015年 liyan. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    var navTitle: String!
    var vClass: AnyClass!
    
    convenience init(navTitle: String!, vClass: AnyClass!) {
        self.init()
        
        self.navTitle = navTitle
        self.vClass   = vClass
        self.title    = navTitle
    }

    override func loadView() {
        self.view = self.vClass.new() as! UIView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = self.navTitle;
    }
}
