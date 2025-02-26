//
//  SearchViewEventDelegate.swift
//  UiKit tutorial
//
//  Created by David Luna on 25/02/25.
//

import Foundation

protocol SearchViewEventDelegate : AnyObject {
    func searchView(didClickSearchButton text: String)
}
