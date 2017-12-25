//
//  LEHomeViewController.swift
//  Weibo
//
//  Created by 顾春华 on 2017/12/22.
//  Copyright © 2017年 leslie. All rights reserved.
//

import UIKit

class LEHomeViewController: LEBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension LEHomeViewController {
    
    override func setupUI() {
        super.setupUI()
        view.backgroundColor = .red
        
        // 设置导航栏按钮
        navItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", style: .plain, target: self, action: #selector(showFriends))
    }
    
    
    @objc private func showFriends()  {
        print(#function)
        let vc = LEDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
