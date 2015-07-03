//
//  MASExampleBasicView.swift
//  SwiftDemo
//
//  Created by liyan on 15/7/1.
//  Copyright (c) 2015年 liyan. All rights reserved.
//

import UIKit

class MASExampleBasicView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var greenView = UIView()
        greenView.backgroundColor = UIColor.greenColor()
        greenView.layer.borderColor = UIColor.blackColor().CGColor
        greenView.layer.borderWidth = 2
        self.addSubview(greenView)
        
        var redView = UIView()
        redView.backgroundColor = UIColor.redColor()
        redView.layer.borderColor = UIColor.blackColor().CGColor
        redView.layer.borderWidth = 2
        self.addSubview(redView)
        
        
        var blueView = UIView()
        blueView.backgroundColor = UIColor.blueColor()
        blueView.layer.borderColor = UIColor.blackColor().CGColor
        blueView.layer.borderWidth = 2
        self.addSubview(blueView)
        
        var padding = 10
        greenView.snp_makeConstraints { (make) -> Void in
            make.top.greaterThanOrEqualTo(self.snp_top).offset(padding)
            make.left.equalTo(self.snp_left).offset(padding)
            make.bottom.equalTo(blueView.snp_top).offset(-padding)
            make.right.equalTo(redView.snp_left).offset(-padding)
            make.width.equalTo(redView.snp_width)
            make.height.equalTo(redView.snp_height)
            make.height.equalTo(blueView.snp_height)
        }
        
        
        
        redView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_top).offset(padding); //with with
            make.left.equalTo(greenView.snp_right).offset(padding); //without with
            make.bottom.equalTo(blueView.snp_top).offset(-padding);
            make.right.equalTo(self.snp_right).offset(-padding);
            make.width.equalTo(greenView.snp_width);
            make.height.equalTo(greenView.snp_height)
            make.height.equalTo(blueView.snp_height)
        }
        
        blueView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(greenView.snp_bottom).offset(padding);
            make.left.equalTo(self.snp_left).offset(padding);
            make.bottom.equalTo(self.snp_bottom).offset(-padding);
            make.right.equalTo(self.snp_right).offset(-padding);
            make.height.equalTo(greenView.snp_height)
            make.height.equalTo(redView.snp_height)
        }
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
