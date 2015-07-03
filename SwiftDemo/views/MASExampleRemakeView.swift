//
//  MASExampleRemakeView.swift
//  SwiftDemo
//
//  Created by liyan on 15/7/2.
//  Copyright (c) 2015年 liyan. All rights reserved.
//

import UIKit

class MASExampleRemakeView: UIView {

    var movingButton: UIButton!
    var topLeft:Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        movingButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        movingButton.setTitle("Move Me!", forState: UIControlState.Normal)
        movingButton.layer.borderColor = UIColor.greenColor().CGColor
        movingButton.layer.borderWidth = 3;
        self.movingButton.addTarget(self, action: Selector("toggleButtonPosition"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(self.movingButton)
        
        self.topLeft = true
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func requiresConstraintBasedLayout()->Bool
    {
        return true
    }
    
    override func updateConstraints() {
        self.movingButton.snp_remakeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(100)
            
            if self.topLeft
            {
                make.left.equalTo(self.snp_left).offset(10)
                make.top.equalTo(self.snp_top).offset(10)
            }
            else
            {
                make.bottom.equalTo(self.snp_bottom).offset(-10)
                make.right.equalTo(self.snp_right).offset(-10)
            }
        }
        
        super.updateConstraints()
    }
    
    func toggleButtonPosition()
    {
        self.topLeft = !self.topLeft
        self.setNeedsUpdateConstraints()
        self.updateConstraintsIfNeeded()
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.layoutIfNeeded()
        })
    }
    
    

}
