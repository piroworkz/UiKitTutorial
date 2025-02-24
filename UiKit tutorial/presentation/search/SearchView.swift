//
//  SearchView.swift
//  UiKit tutorial
//
//  Created by David Luna on 23/02/25.
//

import UIKit

class SearchView: UIView {
    typealias ButtonClick = (String) -> Void
    typealias TextChange = (String) -> Void
    
    private let logoImageView = UIImageView()
    private let searchInputTextField = InputTextFieldView()
    private let searchButton = LoginButtonView(backgrioundColor: .systemGreen, title: "Search")
    private let onSearchButtonTap: ButtonClick
    private var onSearchTextChange: TextChange
    
    init(
        onSearchButtonTap: @escaping ButtonClick,
        onSearchTextChange: @escaping TextChange
    ) {
        self.onSearchButtonTap = onSearchButtonTap
        self.onSearchTextChange = onSearchTextChange
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func validateSearchInputTextField() {
        searchInputTextField.validate()
    }
    
    private func setup() {
        backgroundColor = .white
        addImageView()
        addSearchButton()
        addSearchTextField()
        setupEventHandlers()
    }
    
    private func setupEventHandlers() {
        searchButton.addTarget(self, action: #selector(handleSearchButtonTap), for: .touchUpInside)
        searchInputTextField.addTarget(self, action: #selector(handleSearchTextChange), for: .editingChanged)
    }
    
    @objc private func handleSearchButtonTap() {
        onSearchButtonTap(searchInputTextField.text ?? "")
    }
    
    @objc private func handleSearchTextChange() {
        onSearchTextChange(searchInputTextField.text ?? "")
    }
    
    private func addImageView() {
        addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(resource: .logo)
        constraintImageView()
    }
    
    private func constraintImageView() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Size.large),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: Size.xxLarge),
            logoImageView.widthAnchor.constraint(equalToConstant: Size.xxLarge)
        ])
        
    }
    
    private func addSearchTextField() {
        addSubview(searchInputTextField)
        constraintSearchTextField()
    }
    
    private func constraintSearchTextField() {
        NSLayoutConstraint.activate([
            searchInputTextField.bottomAnchor.constraint(equalTo: searchButton.topAnchor, constant: -Margin.xxLarge),
            searchInputTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchInputTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Multiplier.eightyPercent),
            searchInputTextField.heightAnchor.constraint(equalToConstant: Size.small)
        ])
    }
    
    private func addSearchButton() {
        addSubview(searchButton)
        constraintSearchButton()
    }
    
    private func constraintSearchButton() {
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Margin.xLarge),
            searchButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            searchButton.heightAnchor.constraint(equalToConstant: Size.small)
        ])
    }
}
