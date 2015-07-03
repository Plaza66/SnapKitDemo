//
//  MASExampleScrollView.swift
//  SwiftDemo
//
//  Created by liyan on 15/7/2.
//  Copyright (c) 2015年 liyan. All rights reserved.
//

import UIKit

class MASExampleScrollView: UIView {

    var scrollView: UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.scrollView = UIScrollView(frame: CGRectZero)
        
        self.addSubview(self.scrollView)
        self.scrollView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
        }
        
        self.generateContent()
    }
    
    func generateContent()
    {
        var contentView = UIView()
        
        self.scrollView.addSubview(contentView)
        
        contentView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.scrollView)
            make.width.equalTo(self.scrollView)
        }
        
        var lastView:UIView?
        var height = 25
        
        for i in 0...10
        {
            var view = UIView()
            contentView.addSubview(view)
            view.backgroundColor = self.randomColor()
            
            view.snp_makeConstraints({ (make) -> Void in
                if let _lastView = lastView
                {
                    make.top.equalTo(_lastView.snp_bottom)

                }
                else
                {
                    make.top.equalTo(0)
                }
                
                make.left.equalTo(0)
                make.width.equalTo(contentView.snp_width)
                make.height.equalTo(height)
                
            })
            
            height += 25;
            lastView = view
        }
        
        contentView .snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(lastView!.snp_bottom)
        }
        
        
    }
    
    func randomColor()->UIColor
    {
        var hue: CGFloat        = (CGFloat(arc4random()%256) / 256.0)
        var saturation: CGFloat = (CGFloat(arc4random()%128) / 256.0) + 0.5
        var brightness:CGFloat  = (CGFloat(arc4random()%128) / 256.0) + 0.5
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
