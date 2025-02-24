//
//  FollowersViewController.swift
//  UiKit tutorial
//
//  Created by David Luna on 24/02/25.
//

import UIKit

class FollowersViewController: UIViewController {
    
    var searchQuery: SearchQuery?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let searchQuery = searchQuery {
            navigationController?.isNavigationBarHidden = false
            title = searchQuery.title
        }
    }

}

struct SearchQuery {
    let username: String
    let title: String
    
    init(username: String, title: String) {
        self.username = username
        self.title = title
    }
}
