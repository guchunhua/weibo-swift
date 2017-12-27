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
        setupComposeButton()
    }
    
    /* 只支持竖屏 portrait
       横屏      landscape
     */
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    fileprivate lazy var addButton : UIButton = {
        let button = UIButton.init(type: UIButtonType.custom)
        button.setBackgroundImage(UIImage.init(named: "page_follow_add_background"), for: .normal)
        button.setImage(UIImage.init(named: "shield_center_pop_icon_add"), for: .normal)
        return button
    }()
    
    // FIXME: 待完成
    // @objc 允许这个函数在运行的时候通过OC的消息机制被调用
    @objc private func addStatus() {
        print("撰写微博")
        // 测试方向旋转
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.blue
        let nav = UINavigationController.init(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
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
            arrayM.append(LENavgationController.init(rootViewController:(controller(dict: dict))))
        }
        
        viewControllers = arrayM
    }
    
    private func controller(dict: [String : String]) -> UIViewController {
        
        guard let clsName =  dict["clsName"],
            let title = dict["title"],
            let _ = dict["imageName"]
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
    
    private func setupComposeButton() {
        
        let count = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count - 1
        addButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        tabBar.addSubview(addButton)
        
        // 按钮监听方法
        addButton.addTarget(self, action: #selector(addStatus), for: .touchUpInside)
    }
}
