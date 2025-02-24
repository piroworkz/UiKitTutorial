//
//  ViewController.swift
//  UiKit tutorial
//
//  Created by David Luna on 23/02/25.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var searchView: SearchView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        addSearchView()
    }
    
    private func addSearchView() {
        searchView = SearchView(
            onSearchButtonTap: { [weak self] text in
                guard let self else { return }
                self.onSearchClicked(text)
            },
            onSearchTextChange: { [weak self] text in
                guard let self else { return }
                self.onSearchTextChanged(text)
            }
        )
        if let searchView = searchView {
            view.addSubview(searchView)
            searchView.frame = view.bounds
        }
    }
    
    private func onSearchClicked(_ text: String) {
        if !text.isEmpty {
            let followersViewController = FollowersViewController()
            followersViewController.searchQuery = SearchQuery(username: text, title: "\(text)'s Followers")
            navigate(to: followersViewController)
        }
    }
    
    private func onSearchTextChanged(_ text: String) {
        searchView?.validateSearchInputTextField()
    }
}


extension UIViewController {
    func navigate(to destination: UIViewController) {
        navigationController?.pushViewController(destination, animated: true)
    }
}
