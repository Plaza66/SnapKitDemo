//
//  MASExampleArrayView.swift
//  SwiftDemo
//
//  Created by liyan on 15/7/2.
//  Copyright (c) 2015年 liyan. All rights reserved.
//

import UIKit

class MASExampleArrayView: UIView {

    var _offset: CGFloat?
    var offset: CGFloat?
    {
        get{
           return _offset
        }
        set{
            _offset = newValue;
            self.setNeedsUpdateConstraints()
        }
    }

    let kArrayExampleIncrement:CGFloat = 10.0
    
    var buttonViews:Array<UIButton>!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.offset = 0.0
        var raiseButton: UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        raiseButton.setTitle("Raise", forState: UIControlState.Normal)
        raiseButton.addTarget(self, action: Selector("raiseAction"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(raiseButton)
        
        var centerButton: UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        centerButton.setTitle("Center", forState: UIControlState.Normal)
        centerButton.addTarget(self, action: Selector("centerAction"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(centerButton)
        
        var lowerButton: UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        lowerButton.setTitle("Lower", forState: UIControlState.Normal)
        lowerButton.addTarget(self, action: Selector("lowerAction"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(lowerButton)
        
        raiseButton.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(10)
        }
        
        centerButton.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self)
        }
        
        lowerButton.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(self).offset(-10)
        }
        
        
        self.buttonViews = [];
        self.buttonViews.append(raiseButton)
        self.buttonViews.append(centerButton)
        self.buttonViews.append(lowerButton)
        
    }
    
    func centerAction()
    {
        self.offset = 0.0
    }
    
    func raiseAction()
    {
        self.offset! -= kArrayExampleIncrement
    }
    
    func lowerAction()
    {
        self.offset! += kArrayExampleIncrement
    }
    
    override func updateConstraints() {
    
        
        for btn:UIButton in self.buttonViews
        {
            btn.snp_updateConstraints({ (make) -> Void in
                make.baseline.equalTo(self.snp_centerY).offset(self.offset!)
            })
        }
        super.updateConstraints()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
