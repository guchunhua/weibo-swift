//
//  LEHomeViewController.swift
//  Weibo
//
//  Created by 顾春华 on 2017/12/22.
//  Copyright © 2017年 leslie. All rights reserved.
//

import UIKit

private let cellId = "cellId" // 定义全局常量,尽量使用private 修饰,否侧导出可以访问
class LEHomeViewController: LEBaseViewController {

    private lazy var statusList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadData() {
        for i in 0..<10 {
            statusList.insert(i.description, at: 0)
        }
        
    }
}

extension LEHomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        cell?.textLabel?.text = statusList[indexPath.row]
        return cell!
    }
}

extension LEHomeViewController {
    
    override func setupUI() {
        super.setupUI()
        view.backgroundColor = .red
        
        // 设置导航栏按钮
        navItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", style: .plain, target: self, action: #selector(showFriends))
        
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    @objc private func showFriends()  {
        print(#function)
        let vc = LEDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
