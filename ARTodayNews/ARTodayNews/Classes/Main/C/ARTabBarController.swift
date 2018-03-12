//
//  ARTabBarController.swift
//  ARTodayNews
//
//  Created by andyron<http://andyron.com> on 2018/3/11.
//  Copyright © 2018年 andyron. All rights reserved.
//

import UIKit

class ARTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabbar = UITabBar.appearance()
        tabbar.theme_tintColor = "colors.tabbarTintColor"
        tabbar.theme_barTintColor = "colors.cellBackgroundColor"
        
        addChildViewControllers()
        
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDayOrNightButtonClicked), name: NSNotification.Name(rawValue: ""), object: nil)
        
    }
    
    @objc func receiveDayOrNightButtonClicked(notification: Notification) {
        let selected = notification.object as! Bool
        if selected {
            for childController in childViewControllers {
                switch childController.title! {
                case "首页": setNightChildController(controller: childController, imageName: "home")
                case "西瓜视频": setNightChildController(controller: childController, imageName: "video")
                case "微头条": setNightChildController(controller: childController, imageName: "weitoutiao")
                case "小视频": setNightChildController(controller: childController, imageName: "huoshan")
                case "": setNightChildController(controller: childController, imageName: "redpackage")
                default: break
                }
            }
        } else {
            for childController in childViewControllers {
                switch childController.title! {
                case "首页": setDayChildController(controller: childController, imageName: "home")
                case "西瓜视频": setDayChildController(controller: childController, imageName: "video")
                case "微头条": setDayChildController(controller: childController, imageName: "weitoutiao")
                case "小视频": setDayChildController(controller: childController, imageName: "huoshan")
                case "": setDayChildController(controller: childController, imageName: "redpackage")
                default: break
                }
            }
        }
        
    }

    /// 设置日间控制器
    private func setDayChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_32x32_")
    }
    
    /// 设置夜间控制器
    private func setNightChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_night_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_night_32x32_")
    }
    
    private func addChildViewControllers() {
        setChildViewController(childController: HomeViewController(), title: "首页", imageName: "home")
    }
    
    private func setChildViewController( childController: UIViewController, title: String, imageName: String) {
        if UserDefaults.standard.bool(forKey: isNight) {
            
        }
    }
    
    

}
