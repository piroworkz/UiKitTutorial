//
//  NavigationExtensions.swift
//  UiKit tutorial
//
//  Created by David Luna on 25/02/25.
//

import UIKit

extension UIViewController {
    func navigate(to destination: UIViewController) {
        navigationController?.pushViewController(destination, animated: true)
    }
}
