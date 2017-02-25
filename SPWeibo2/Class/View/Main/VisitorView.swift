//
//  VisitorView.swift
//  SPWeibo2
//
//  Created by 侯亮宏 on 17/2/25.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    override init(frame:CGRect){
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)

    }
    
    //MARK: -子控件属性
    // 背景图片和遮罩只有首页才有
    lazy var backIconView:UIImageView = {
       let backIconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        backIconView.sizeToFit()
        return backIconView
    }()
    lazy var coverView:UIImageView = {
       let coverView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return coverView
    }()
    
    // 都有的子控件
    lazy var iconView:UIImageView = {
        let iconView = UIImageView()
        return iconView
    }()
    lazy var textView:UILabel = {
       let textView = UILabel()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = UIColor.darkGray
        textView.textAlignment = NSTextAlignment.center
        textView.numberOfLines = 0
        return textView
    }()
    lazy var registerBtn:UIButton = {
       let registerBtn = UIButton()
        registerBtn.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: .normal)
        registerBtn.setTitleColor(UIColor.orange, for: .normal)
        registerBtn.setTitle("登录", for: .normal)
        return registerBtn
    }()
    lazy var loginBtn: UIButton = {
        let loginBtn = UIButton()
        loginBtn.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: .normal)
//        loginBtn.setTitleColor(UIColor.orange, for: .normal)
        loginBtn.setTitle("注册", for: .normal)
        return loginBtn
    }()
    var isHome:Bool = false
    
    func startAnim() {
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = M_PI * 2
        anim.repeatCount = MAXFLOAT
        anim.duration = 20
        anim.isRemovedOnCompletion = false
        
        backIconView.layer.add(anim, forKey: nil)
    }
    
    
}

// MARK: -设置visitorView的布局
extension VisitorView{
    
     func setupSubviews(icon:String,text:String,backIcon:String?){
        if backIcon != nil {
            addSubview(backIconView)
            addSubview(coverView)
            isHome = true
        }
        
        iconView.image = UIImage(named: icon)
        iconView.sizeToFit()
        addSubview(iconView)
        
        textView.text = text
        addSubview(textView)
        
        addSubview(registerBtn)
        addSubview(loginBtn)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for subview in subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        if isHome {
            // 背景图片
            addConstraint(.init(item: backIconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
            addConstraint(.init(item: backIconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
                
            // 遮罩图片
            addConstraint(.init(item: coverView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0))
            addConstraint(.init(item: coverView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0))
            addConstraint(.init(item: coverView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0))
            addConstraint(.init(item: coverView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -160))
        }
        // 图标
        addConstraint(.init(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(.init(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
        // 文字
        addConstraint(.init(item: textView, attribute: .top, relatedBy: .equal, toItem: iconView, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(.init(item: textView, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(.init(item: textView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 224))
        addConstraint(.init(item: textView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        // 登录按钮
        addConstraint(.init(item: loginBtn, attribute: .left, relatedBy: .equal, toItem: textView, attribute: .left, multiplier: 1.0, constant: 0))
        addConstraint(.init(item: loginBtn, attribute: .top, relatedBy: .equal, toItem: textView, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(.init(item: loginBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(.init(item: loginBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        // 注册按钮
        addConstraint(.init(item: registerBtn, attribute: .right, relatedBy: .equal, toItem: textView, attribute: .right, multiplier: 1.0, constant: 0))
        addConstraint(.init(item: registerBtn, attribute: .top, relatedBy: .equal, toItem: textView, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(.init(item: registerBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(.init(item: registerBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        backgroundColor = UIColor(white: 234/255.0, alpha: 1.0)
        
        startAnim()
    }
    
    
    
}
