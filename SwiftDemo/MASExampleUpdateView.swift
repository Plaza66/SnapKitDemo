//
//  MASExampleUpdateView.swift
//  SwiftDemo
//
//  Created by liyan on 15/7/2.
//  Copyright (c) 2015年 liyan. All rights reserved.
//

import UIKit

class MASExampleUpdateView: UIView {

    var growingButton:UIButton!
    
    var buttonSize:CGSize!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        growingButton = UIButton.buttonWithType(UIButtonType.System) as? UIButton
        growingButton.setTitle("Grow Me!", forState: UIControlState.Normal)
        growingButton.layer.borderColor = UIColor.greenColor().CGColor
        growingButton.layer.borderWidth = 3
        
        growingButton.addTarget(self, action:Selector("didTapGrowButton"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.addSubview(growingButton)
        
        buttonSize = CGSizeMake(100, 100)
    }
    
    override class func requiresConstraintBasedLayout()->Bool
    {
        return true
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didTapGrowButton()
    {
        buttonSize = CGSizeMake(buttonSize.width*1.3, buttonSize.height*1.3)
        self.setNeedsUpdateConstraints()
        self.updateConstraintsIfNeeded()
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.layoutIfNeeded()
        })
    }
    
    override func updateConstraints() {
        self.growingButton .snp_updateConstraints { (make) -> Void in
            make.center.equalTo(self)
            make.width.equalTo(buttonSize.width).priorityLow()
            make.height.equalTo(buttonSize.height).priorityLow()
            
            make.width.lessThanOrEqualTo(self)
            make.height.lessThanOrEqualTo(self)
            
            super.updateConstraints()
        }
    }

}
