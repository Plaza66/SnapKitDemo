//
//  MASExampleSidesView.swift
//  SwiftDemo
//
//  Created by liyan on 15/7/2.
//  Copyright (c) 2015年 liyan. All rights reserved.
//

import UIKit

class MASExampleSidesView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var lastView:UIView = self
    
        for i in 0...10
        {
            var tempView = UIView()
            tempView.backgroundColor = self.randomColor()
            tempView.layer.borderColor = UIColor.blackColor().CGColor
            tempView.layer.borderWidth = 2
            self.addSubview(tempView)
            
            tempView.snp_makeConstraints({ (make) -> Void in
                make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(5, 10, 15, 20));
            })
            lastView = tempView
        }
        
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func randomColor()->UIColor
    {
        var hue: CGFloat        = (CGFloat(arc4random()%256) / 256.0)
        var saturation: CGFloat = (CGFloat(arc4random()%128) / 256.0) + 0.5
        var brightness:CGFloat  = (CGFloat(arc4random()%128) / 256.0) + 0.5
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
}
