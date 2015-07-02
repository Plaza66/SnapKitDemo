//
//  ViewController.swift
//  SwiftDemo
//
//  Created by liyan on 15/7/1.
//  Copyright (c) 2015年 liyan. All rights reserved.
//

import UIKit
import SnapKit

class ViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {

    var exampleControllers: [DemoViewController] = []
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "demoSD")
        self.tableView.tableFooterView = UIView()
        self.view.addSubview(self.tableView)
        
        self.tableView .snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
        
        self.tableView.dataSource = self;
        self.tableView.delegate   = self;
    
        self.exampleControllers .append(DemoViewController(navTitle: "Basic", vClass: MASExampleBasicView.self))
//        [[MASExampleViewController alloc] initWithTitle:@"Basic"
//        viewClass:MASExampleBasicView.class],
//        [[MASExampleViewController alloc] initWithTitle:@"Update Constraints"
//        viewClass:MASExampleUpdateView.class],
//        [[MASExampleViewController alloc] initWithTitle:@"Remake Constraints"
//        viewClass:MASExampleRemakeView.class],
//        [[MASExampleViewController alloc] initWithTitle:@"Using Constants"
//        viewClass:MASExampleConstantsView.class],
//        [[MASExampleViewController alloc] initWithTitle:@"Composite Edges"
//        viewClass:MASExampleSidesView.class],
//        [[MASExampleViewController alloc] initWithTitle:@"Aspect Fit"
//        viewClass:MASExampleAspectFitView.class],
//        [[MASExampleViewController alloc] initWithTitle:@"Basic Animated"
//        viewClass:MASExampleAnimatedView.class],
//        [[MASExampleViewController alloc] initWithTitle:@"Debugging Helpers"
//        viewClass:MASExampleDebuggingView.class],
//        [[MASExampleViewController alloc] initWithTitle:@"Bacony Labels"
//        viewClass:MASExampleLabelView.class],
//        [[MASExampleViewController alloc] initWithTitle:@"UIScrollView"
//        viewClass:MASExampleScrollView.class],
//        [[MASExampleViewController alloc] initWithTitle:@"Array"
//        viewClass:MASExampleArrayView.class],
//        [[MASExampleViewController alloc] initWithTitle:@"Attribute Chaining"
//        viewClass:MASExampleAttributeChainingView.class],
//        [[MASExampleViewController alloc] initWithTitle:@"Margins"
//        viewClass:MASExampleMarginView.class]
        
        self.tableView.reloadData()
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.exampleControllers.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var vc   = self.exampleControllers[indexPath.row]
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("demoSD", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.textColor = UIColor.blackColor()
        cell.textLabel!.text = vc.title;
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var vc   = self.exampleControllers[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

