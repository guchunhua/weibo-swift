//
//  Bundle+Extension.swift
//  Weibo
//
//  Created by 顾春华 on 2017/12/22.
//  Copyright © 2017年 leslie. All rights reserved.
//

import Foundation

extension Bundle {
//    func nameSpace() -> String {
//      return  Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
//    }
    
    // 计算型属性,不占用空间,类似于函数,没有参数有返回值
    var nameSpace: String {
        return  Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
