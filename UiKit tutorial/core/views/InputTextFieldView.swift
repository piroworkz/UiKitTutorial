//
//  InputTextFieldView.swift
//  UiKit tutorial
//
//  Created by David Luna on 23/02/25.
//

import UIKit

class InputTextFieldView: UITextField {
    
    private let padding = UIEdgeInsets(top: Margin.zero, left: Margin.medium, bottom: Margin.zero, right: Margin.large)
    private let errorLabelView: ErrorLabelView = ErrorLabelView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupErrorLabel()
    }
    
    @discardableResult
    func isValid() -> Bool {
        if let error = validateText(text) {
            onErrorTheme(error)
            return false
        } else {
            setupLayer()
            return true
        }
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        autocorrectionType = .no
        keyboardType = .default
        returnKeyType = .done
        placeholder = "Enter username"
        clearButtonMode = .whileEditing
        setupLayer()
        setupFont()
        setupColorTheme()
    }
    
    private func setupErrorLabel() {
        guard let superview = superview else { return }
        superview.addSubview(errorLabelView)
        
        NSLayoutConstraint.activate([
            errorLabelView.topAnchor.constraint(equalTo: bottomAnchor, constant: Margin.xSmall),
            errorLabelView.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorLabelView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupLayer() {
        errorLabelView.hide()
        layer.cornerRadius = Margin.small
        layer.borderWidth = Border.two
        layer.borderColor = UIColor.systemGray4.cgColor
    }
    
    private func setupFont() {
        textAlignment = .left
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = FontSize.large
    }
    
    private func setupColorTheme() {
        textColor = .label
        tintColor = .label
        backgroundColor = .tertiarySystemBackground
    }
    
    private func validateText(_ text: String?) -> String? {
        guard let text = text else {
            return nil
        }
        if text.isEmpty {
            return "Required Field"
        } else if text.count < 10 {
            return "Must be at least 10 characters"
        } else if !text.allSatisfy( { $0.isLetter || $0.isNumber || $0.isLowercase } ) {
            return "Invalid characters"
        } else {
            return nil
        }
    }
    
    private func onErrorTheme(_ error: String) {
        errorLabelView.show(error)
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = Border.three
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
