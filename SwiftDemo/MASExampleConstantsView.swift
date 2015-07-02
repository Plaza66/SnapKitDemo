//
//  MASExampleConstantsView.swift
//  SwiftDemo
//
//  Created by liyan on 15/7/2.
//  Copyright (c) 2015年 liyan. All rights reserved.
//

import UIKit

class MASExampleConstantsView: UIView {
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var purpleView = UIView();
        purpleView.backgroundColor = UIColor.purpleColor();
        purpleView.layer.borderColor = UIColor.blackColor().CGColor
        purpleView.layer.borderWidth = 2
        self.addSubview(purpleView)
        
        var orangeView = UIView()
        orangeView.backgroundColor = UIColor.orangeColor()
        orangeView.layer.borderColor = UIColor.blackColor().CGColor
        orangeView.layer.borderWidth = 2
        self.addSubview(orangeView)
        
        
        purpleView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(20);
            make.left.equalTo(20);
            make.bottom.equalTo(-20);
            make.right.equalTo(-20);
        }
        
        orangeView.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(CGPointMake(0, 50))
            make.size.equalTo(CGSizeMake(200, 100))
        }
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
