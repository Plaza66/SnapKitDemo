//
//  MASExampleLabelView.swift
//  SwiftDemo
//
//  Created by liyan on 15/7/2.
//  Copyright (c) 2015年 liyan. All rights reserved.
//

import UIKit
class MASExampleLabelView: UIView {

    var kPadding: UIEdgeInsets =  UIEdgeInsetsMake(10, 10, 10, 10)

    var shortLabel: UILabel!
    var longLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.shortLabel = UILabel()
        self.shortLabel.numberOfLines = 1;
        self.shortLabel.textColor = UIColor.purpleColor()
        self.shortLabel.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        self.shortLabel.text = "Bacon";
        self.addSubview(self.shortLabel)
        
        self.longLabel = UILabel()
        self.longLabel.numberOfLines = 8
        self.longLabel.textColor = UIColor.darkGrayColor()
        self.longLabel.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        self.longLabel.text = "Bacon ipsum dolor sit amet spare ribs fatback kielbasa salami, tri-tip jowl pastrami flank short loin rump sirloin. Tenderloin frankfurter chicken biltong rump chuck filet mignon pork t-bone flank ham hock.";
        self.addSubview(self.longLabel)

        self.longLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.snp_left).insets(kPadding)
            make.top.equalTo(self.snp_top).insets(kPadding)
        }
        self.shortLabel.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.longLabel.snp_centerY)
            make.right.equalTo(self.snp_right).insets(kPadding)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var width: CGFloat = CGRectGetMinX(self.shortLabel.frame) - kPadding.left;
        width -= CGRectGetMinX(self.longLabel.frame);
        self.longLabel.preferredMaxLayoutWidth = width;
        
        super.layoutSubviews()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
