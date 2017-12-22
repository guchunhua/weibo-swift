//
//  LEMainViewController.swift
//  Weibo
//
//  Created by 顾春华 on 2017/12/22.
//  Copyright © 2017年 leslie. All rights reserved.
//

import UIKit

class LEMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupChildControllers()
    }
    
    fileprivate lazy var addButton : UIButton = {
        
        let button = UIButton.init(type: UIButtonType.custom)
        
        return button
    }()
}

extension LEMainViewController {
    private func setupChildControllers(){
       let array = [
            ["clsName":"LEHomeViewController","title":"首页","imageName":""],
            ["clsName":"LEMessageViewController","title":"消息","imageName":""],
            ["clsName":"UIViewController"],
            ["clsName":"LEDiscoverViewController","title":"发现","imageName":""],
            ["clsName":"LEPorfileViewController","title":"我","imageName":""],
        ]
        var arrayM = [UIViewController]()
        for dict in array{
            arrayM.append((controller(dict: dict)))
        }
        
        viewControllers = arrayM
    }
    
    private func controller(dict: [String : String]) -> UIViewController {
        
        guard  let clsName =  dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imageName"]
        else {
            return UIViewController()
        }
        
        // 命名空间和反射
        let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? UIViewController.Type
        
        let vc = cls?.init()
        vc?.title = title
        vc?.tabBarItem.setTitleTextAttributes([ NSAttributedStringKey.foregroundColor : UIColor.orange], for: .highlighted)
        return vc!
    }
}
