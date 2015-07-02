//
//  MASExampleAnimatedView.swift
//  SwiftDemo
//
//  Created by liyan on 15/7/2.
//  Copyright (c) 2015年 liyan. All rights reserved.
//

import UIKit
import SnapKit

class MASExampleAnimatedView: UIView {

    
    var animatableConstraints:[AnyObject] = []
    var padding:Int = 10
    var animating:Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var greenView = UIView()
        greenView.backgroundColor = UIColor.greenColor()
        greenView.layer.borderColor = UIColor.blackColor().CGColor
        greenView.layer.borderWidth = 2
        self.addSubview(greenView)
        
        var redView = UIView()
        redView.backgroundColor = UIColor.redColor();
        redView.layer.borderColor = UIColor.blackColor().CGColor;
        redView.layer.borderWidth = 2
        self.addSubview(redView)
        
        var blueView = UIView()
        blueView.backgroundColor = UIColor.blueColor()
        blueView.layer.borderColor = UIColor.blackColor().CGColor
        blueView.layer.borderWidth = 2;
        self.addSubview(blueView)
        
        var superview = self;
        var tempPadding = padding;
        
        var paddingInsets:UIEdgeInsets = UIEdgeInsetsMake(CGFloat(padding), CGFloat(padding), CGFloat(padding), CGFloat(padding))
        greenView.snp_makeConstraints { (make) -> Void in
        
            animatableConstraints.append(make.edges.equalTo(superview).insets(paddingInsets).priorityLow())
            animatableConstraints.append(make.bottom.equalTo(blueView.snp_top).offset(-padding))
            make.size.equalTo(redView)
            make.height.equalTo(blueView.snp_height);
            
        }
        
        redView.snp_makeConstraints { (make) -> Void in
            
            animatableConstraints.append(make.edges.equalTo(superview).insets(paddingInsets).priorityLow())
            animatableConstraints.append(make.bottom.equalTo(blueView.snp_top).offset(-padding))
            animatableConstraints.append(make.left.equalTo(greenView.snp_right).offset(padding))
            
            make.size.equalTo(greenView)
            make.height.equalTo(blueView.snp_height);
            
        }
        
        blueView.snp_makeConstraints { (make) -> Void in
            
            animatableConstraints.append(make.edges.equalTo(superview).insets(paddingInsets).priorityLow())
            make.height.equalTo(redView.snp_height);
            make.height.equalTo(greenView.snp_height);

        }
        
        
    }
    
    
    override func didMoveToWindow() {
        self.layoutIfNeeded()
        
        if((self.window) != nil)
        {
            self.animating = true
            self.animateWithInvertedInsets(false)
            
        }
    }
    
    override func willMoveToWindow(newWindow: UIWindow?) {
        self.animating = newWindow != nil
    }
    
    
    func animateWithInvertedInsets(invertedInsets: Bool)
    {
        if(self.animating == false)
        {
            return
        }
        
        var _padding = invertedInsets ? 100 : self.padding
        var paddingInsets:UIEdgeInsets = UIEdgeInsetsMake(CGFloat(_padding), CGFloat(_padding), CGFloat(_padding), CGFloat(_padding));
    
        for constraint in self.animatableConstraints
        {
            let _constraint:ConstraintDescriptionEditable = constraint as! ConstraintDescriptionEditable
            
            _constraint.insets(paddingInsets)
//            ConstraintDescriptionEditable(constraint).insets = paddingInsets
//
//            constraint as! ConstraintItem
        }
    
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.layoutIfNeeded()
            }) { (finished) -> Void in
                self.animateWithInvertedInsets(!invertedInsets)
        }
    
    
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
