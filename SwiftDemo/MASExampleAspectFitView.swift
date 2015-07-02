//
//  MASExampleAspectFitView.swift
//  SwiftDemo
//
//  Created by liyan on 15/7/2.
//  Copyright (c) 2015年 liyan. All rights reserved.
//

import UIKit

class MASExampleAspectFitView: UIView {

    var topView: UIView!
    var topInnerView: UIView!
    var bottomView: UIView!
    var bottomInnerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        topView = UIView(frame: CGRectZero)
        topInnerView = UIView(frame: CGRectZero)
        bottomView   = UIView(frame: CGRectZero)
        bottomInnerView = UIView(frame: CGRectZero)
        
        var blueColor:UIColor = UIColor(red: 0.663, green: 0.796, blue: 0.996, alpha: 1)
        topView.backgroundColor = blueColor
        
        var lightGreenColor:UIColor = UIColor(red: 0.784, green: 0.992, blue: 0.851, alpha: 1)
        topInnerView.backgroundColor = lightGreenColor

        var pinkColor:UIColor = UIColor(red: 0.992, green: 0.804, blue: 0.941, alpha: 1)
        bottomView.backgroundColor = pinkColor

        var darkGreenColor:UIColor = UIColor(red: 0.443, green: 0.780, blue: 0.337, alpha: 1)
        bottomInnerView.backgroundColor = darkGreenColor

        
        self.addSubview(topView)
        topView.snp_makeConstraints { (make) -> Void in
            make.left.right.top.equalTo(self)
        }
        
        self.addSubview(bottomView)
        bottomView.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(topView.snp_bottom)
            make.height.equalTo(topView.snp_height)
        }
        
        topView.addSubview(topInnerView)
        topInnerView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(topInnerView.snp_height).multipliedBy(3)
            make.width.height.lessThanOrEqualTo(topView)
            make.width.height.equalTo(topView).priorityLow()
            make.center.equalTo(topView)
        }
        
        bottomView.addSubview(bottomInnerView)
        bottomInnerView.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(bottomInnerView.snp_width).multipliedBy(3);
            make.width.height.lessThanOrEqualTo(bottomView);
            make.width.height.equalTo(bottomView).priorityLow();
            make.center.equalTo(bottomView);

        }
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
