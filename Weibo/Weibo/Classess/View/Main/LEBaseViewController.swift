//
//  LEBaseViewController.swift
//  Weibo
//
//  Created by 顾春华 on 2017/12/22.
//  Copyright © 2017年 leslie. All rights reserved.
//

import UIKit

class LEBaseViewController: UIViewController {
    // 如果用户没有登录,就不创建
    var tableView : UITableView?
    
    lazy var navigationBar = LECustomNavigationBar(frame : CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))

    lazy var navItem = UINavigationItem.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        loadData()
    }

    // 重写title 的 didSet方法
    override var title: String?{
        didSet{
            navItem.title = title
        }
    }
    
    func loadData() {
        
    }
}

extension LEBaseViewController {
   @objc func setupUI() {
        view.backgroundColor = UIColor.gray
        // 隐藏了导航栏,缩进20个点
        automaticallyAdjustsScrollViewInsets = false
        setupNavBar()
        setupTableView()
    }
    
    private func setupNavBar() {
        navigationBar.tintColor = UIColor.darkGray
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.darkGray]
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
    }
    
    private func setupTableView() {
        tableView = UITableView.init(frame: view.bounds, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        if #available(iOS 11.0,*) { // ios11以上的系统
            tableView?.contentInset = UIEdgeInsetsMake(navigationBar.bounds.height - 20, 0, tabBarController?.tabBar.bounds.height ?? 49, 0)

        }else {
            tableView?.contentInset = UIEdgeInsetsMake(navigationBar.bounds.height, 0, tabBarController?.tabBar.bounds.height ?? 49, 0)
        }
        view.insertSubview(tableView!, belowSubview: navigationBar)
    }
}

// MARK: 代理方法
// 基类准备方法,子类具体实现
extension LEBaseViewController: UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
}
