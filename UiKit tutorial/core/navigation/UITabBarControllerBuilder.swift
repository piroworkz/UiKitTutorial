//
//  File.swift
//  UiKit tutorial
//
//  Created by David Luna on 23/02/25.
//

import UIKit

extension UITabBarController {
    
    func config() -> UITabBarController {
        UITabBar.appearance().tintColor = .systemGreen
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barStyle = .black
        viewControllers = [
            NavDestination("Search", UITabBarItem(tabBarSystemItem: .search, tag: 0), SearchViewController()).navController,
            NavDestination("Favorites",UITabBarItem(tabBarSystemItem: .favorites, tag: 1),FavoritesViewController()).navController
        ]
        return self
    }
}

extension UINavigationController {
    
    func config() -> UINavigationController {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = .systemGreen // Color de los botones
        
        return self
    }
}
