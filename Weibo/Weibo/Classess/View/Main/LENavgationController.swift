//
//  LENavgationController.swift
//  Weibo
//
//  Created by 顾春华 on 2017/12/22.
//  Copyright © 2017年 leslie. All rights reserved.
//

import UIKit

class LENavgationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 隐藏默认的导航栏
        navigationBar.isHidden = true
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }

}
