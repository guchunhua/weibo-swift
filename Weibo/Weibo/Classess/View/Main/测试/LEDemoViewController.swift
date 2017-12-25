//
//  LEDemoViewController.swift
//  Weibo
//
//  Created by 顾春华 on 2017/12/25.
//  Copyright © 2017年 leslie. All rights reserved.
//

import UIKit

class LEDemoViewController: LEBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "第 \(navigationController?.childViewControllers.count ?? 0) 个"
    }
}



extension LEDemoViewController {
    override func setupUI() {
        super.setupUI()
        navItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一个", style: .plain, target: self, action: #selector(nextController))
    }
    
    @objc private func nextController()  {
        let vc = LEDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
