//
//  NavDestination.swift
//  UiKit tutorial
//
//  Created by David Luna on 23/02/25.
//

import UIKit

struct NavDestination{
    let title: String
    let tabBarItem: UITabBarItem
    let destination: UIViewController
    
    init(_ title: String,_ tabBarItem: UITabBarItem,_ destination: UIViewController) {
        self.title = title
        self.tabBarItem = tabBarItem
        self.destination = destination
    }
    
    var navController: UINavigationController {
        destination.title = title
        destination.tabBarItem = tabBarItem
        return UINavigationController(rootViewController: destination)
    }
    
}
