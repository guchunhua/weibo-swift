//
//  LEBaseViewController.swift
//  Weibo
//
//  Created by 顾春华 on 2017/12/22.
//  Copyright © 2017年 leslie. All rights reserved.
//

import UIKit

class LEBaseViewController: UIViewController {
    
    lazy var navigationBar = LECustomNavigationBar(frame : CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))

    lazy var navItem = UINavigationItem.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }

    // 重写title 的 didSet方法
    override var title: String?{
        didSet{
            navItem.title = title
        }
    }
}

extension LEBaseViewController {
   @objc func setupUI() {
        view.backgroundColor = UIColor.gray
        navigationBar.tintColor = UIColor.darkGray
    navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.darkGray]
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
    }
    
   
}
