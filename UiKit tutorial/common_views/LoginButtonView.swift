//
//  LoginButtonView.swift
//  UiKit tutorial
//
//  Created by David Luna on 23/02/25.
//

import UIKit

class LoginButtonView: UIButton {
    
    init(backgrioundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgrioundColor
        self.setTitle(title, for: .normal)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required convenience init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
