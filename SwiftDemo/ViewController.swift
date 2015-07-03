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
    
        self.exampleControllers.append(DemoViewController(navTitle: "Basic", vClass: MASExampleBasicView.self))
        self.exampleControllers.append(DemoViewController(navTitle: "Update Constraints", vClass: MASExampleUpdateView.self))
        self.exampleControllers.append(DemoViewController(navTitle: "Remake Constraints", vClass: MASExampleRemakeView.self))
        self.exampleControllers.append(DemoViewController(navTitle: "Using Constants", vClass: MASExampleConstantsView.self))
        self.exampleControllers.append(DemoViewController(navTitle: "Composite Edges", vClass: MASExampleSidesView.self))
        self.exampleControllers.append(DemoViewController(navTitle: "Aspect Fit", vClass: MASExampleAspectFitView.self))
        self.exampleControllers.append(DemoViewController(navTitle: "Basic Animated", vClass: MASExampleAnimatedView.self))
        self.exampleControllers.append(DemoViewController(navTitle: "Debugging Helpers", vClass: MASExampleDebuggingView.self))
        self.exampleControllers.append(DemoViewController(navTitle: "Bacony Labels", vClass: MASExampleLabelView.self))
        self.exampleControllers.append(DemoViewController(navTitle: "UIScrollView", vClass: MASExampleScrollView.self))
        self.exampleControllers.append(DemoViewController(navTitle: "Array", vClass: MASExampleArrayView.self))
        self.exampleControllers.append(DemoViewController(navTitle: "Attribute Chaining", vClass: MASExampleAttributeChainingView.self))
        self.exampleControllers.append(DemoViewController(navTitle: "Margins", vClass: MASExampleMarginView.self))
        
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

