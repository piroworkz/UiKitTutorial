//
//  SearchView.swift
//  UiKit tutorial
//
//  Created by David Luna on 23/02/25.
//

import UIKit

class SearchView: UIView {
    
    weak var delegate: SearchViewEventDelegate?
    
    private let logoImageView = UIImageView()
    private let searchInputTextField = InputTextFieldView()
    private let searchButton = FilledButtonView(backgroundColor: .systemGreen, title: "Search")
    private let parent: UIView
    
    init(parent: UIView) {
        self.parent = parent
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        parent.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        constraint()
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
        delegate?.searchView(didClickSearchButton: searchInputTextField.text ?? "")
    }
    
    @objc private func handleSearchTextChange() {
        searchInputTextField.isValid()
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
            searchInputTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Factor.eightyPercent),
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
    
    private func constraint() {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor),
            leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
