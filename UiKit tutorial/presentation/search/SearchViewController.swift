//
//  ViewController.swift
//  UiKit tutorial
//
//  Created by David Luna on 23/02/25.
//

import UIKit

class SearchViewController: UIViewController, SearchViewEventDelegate {
    
    private var searchView: SearchView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func searchView(didClickSearchButton text: String) {
        onSearchClicked(text)
    }
    
    private func setUpSearchView() {
        searchView = SearchView(parent: view)
        if let searchView = searchView {
            searchView.delegate = self
        }
    }
    
    private func onSearchClicked(_ text: String) {
        if !text.isEmpty {
            let followersViewController = FollowersViewController()
            followersViewController.searchQuery = SearchQuery(username: text, title: "\(text)'s Followers")
            navigate(to: followersViewController)
        } else {
            showDialog(title: "Username required", body: "Please enter a username to search for followers in GitHub API to continue, thank you! (e.g. @username)", buttonTitle: "OK")
        }
    }
}
