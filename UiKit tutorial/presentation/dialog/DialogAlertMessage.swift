//
//  DialogSpecs.swift
//  UiKit tutorial
//
//  Created by David Luna on 25/02/25.
//

import Foundation

struct DialogAlertMessage {
    let title: String
    let body: String
    let buttonTitle: String
    
    init(title: String, body: String, buttonTitle: String) {
        self.title = title
        self.body = body
        self.buttonTitle = buttonTitle
    }
}
