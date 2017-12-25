//
//  LECustomNavigationBar.swift
//  Weibo
//
//  Created by 顾春华 on 2017/12/25.
//  Copyright © 2017年 leslie. All rights reserved.
//

import UIKit
import DeviceKit

class LECustomNavigationBar: UINavigationBar {
    
    // ios11 中导航栏整体上移了
    override func layoutSubviews() {
        super.layoutSubviews()
        let systemVersion = Float(UIDevice.current.systemVersion) ?? 0.0
        for view in self.subviews {
            if systemVersion >= 11.0 {
                if view.isKind(of: NSClassFromString("_UIBarBackground")!) {
                    var frame = view.frame
                    frame.size.height = 44 + 20
                    if Device().isOneOf([Device.iPhoneX,Device.simulator(Device.iPhoneX)]) {
                        frame.origin.y = 0
                        frame.size.height = 44 + 44
                    }
                    view.frame = frame
                }
            }
            
            if let viewClass = NSClassFromString("_UINavigationBarContentView"),view.isKind(of: viewClass) {
                var frame = view.frame
                frame.origin.y = 20
                
                if Device().isOneOf([Device.iPhoneX,Device.simulator(Device.iPhoneX)]) {
                    frame.origin.y = 44
                }
                view.frame = frame
            }
        }
    }
}


