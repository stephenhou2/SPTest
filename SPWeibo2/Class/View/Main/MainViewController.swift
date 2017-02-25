//
//  MainViewController.swift
//  SPWeibo2
//
//  Created by 侯亮宏 on 17/2/25.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar() // 初始化tabbar
    }

    // tabbar中间按钮 懒加载
    lazy var centerBtn:UIButton = {
       let centerBtn = UIButton()
        return centerBtn
    }()
    
    override func viewWillLayoutSubviews() {
        addCenterBtn()
    }
    
    // 因为swift默认是静态派发（通过函数表 ：witness－table 进行函数查找与消息响应）的,private只能在当前源文件中使用的实体,也就是说只能在当前类里面调用这个方法,点击事件是有系统调用的,这个时候系统找不到这方法就会崩溃(静态派发：)
    // 为了提升性能, Swift会在编译时确定方法和属性, 如果想让Swift支持OC的动态派发那么必须在前面加上@objc
    // 添加 @objc 修饰符并不意味着这个方法或者属性会变成动态派发，Swift 依然可能会将其优化为静态调用
    @objc fileprivate func centerBtnClicked(){
        print("clicked")
    }
    
   
}


// MARK: -设置底部tabbar布局
extension MainViewController{
    fileprivate func setupTabBar(){
        //／ 设置tabbar的一些相关属性，tabbarItem的渲染颜色，tabbar的背景色(barTintColor)和背景图片，tabbarItem的大小和间距等属性是由tabbarController控制的
        tabBar.tintColor = UIColor.orange
        tabBar.backgroundImage = UIImage(named: "tabbar_background")
        tabBar.itemSpacing = CGFloat(5)
        tabBar.isTranslucent = false
        
        addController(title: "主页", img: "tabbar_home", vc: HomeTableViewController())
        addController(title: "消息", img: "tabbar_message_center", vc: MessageTableViewController())
        /// 添加一个空的控制器，使中间空出一个item的位置，后面再用自定义的button遮盖
        addChildViewController(UIViewController())
        addController(title: "发现", img: "tabbar_discover", vc: DiscoverTableViewController())
        addController(title: "我的", img: "tabbar_profile", vc: ProfileTableViewController())

    }
    
    // 设置tabbarItems
    fileprivate func addController(title:String,img:String,vc:UIViewController){
        
        // 创建navigationController 并将 navigationController添加为tabbarController的子控制器
        let nav = UINavigationController(rootViewController: vc)
        addChildViewController(nav)
        
        /// 导航条上的标题，tabbarItem的title都是由 navigationController控制的
        vc.title = title
        vc.tabBarItem.image = UIImage(named: img)
        
    }
    
    fileprivate func addCenterBtn(){
        // 初始化button
        centerBtn.setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: .normal)
        centerBtn.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), for: .normal)
        centerBtn.sizeToFit()
        // 添加button的响应函数
        centerBtn.addTarget(self, action: #selector(centerBtnClicked), for: .touchUpInside)
        
        // 计算每个item的宽度
        let itemW = tabBar.bounds.size.width / 5
        /// insetBy方法返回一个和原cgrect中心点相同，但是宽高通过inset改变过的cgrect
        centerBtn.frame = tabBar.bounds.insetBy(dx: 2 * itemW, dy: 0)
        tabBar.addSubview(centerBtn)
        
    }
    
    
}
