//
//  ErrorLabel.swift
//  UiKit tutorial
//
//  Created by David Luna on 24/02/25.
//

import UIKit

class ErrorLabelView: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(_ error: String) {
        text = error
        isHidden = false
    }
    
    func hide() {
        isHidden = true
    }
    
    private func setup()  {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .systemRed
        font = .systemFont(ofSize: FontSize.small)
        isHidden = true
    }
}
