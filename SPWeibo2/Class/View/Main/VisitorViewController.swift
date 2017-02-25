//
//  VisitorViewController.swift
//  SPWeibo2
//
//  Created by 侯亮宏 on 17/2/25.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit

class VisitorTableViewController: UITableViewController {

    lazy var isVisitor:Bool = true
    
    lazy var visitorView:VisitorView? = VisitorView()
    
    override func loadView() {
        isVisitor ? loadVisitorView() : super.loadView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadVisitorView(){
        view = visitorView
    }
    
    
}

// MARK: -设置visitorView的布局
extension VisitorTableViewController{
    
}
