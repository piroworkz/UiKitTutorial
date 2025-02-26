//
//  DialogView.swift
//  UiKit tutorial
//
//  Created by David Luna on 25/02/25.
//

import UIKit

class DialogView: UIView {
    
    weak var delegate: DialogViewDelegate?
    
    private let titleLabelView = TitleLabelView(textAlignment: .center, textSize: FontSize.xLarge)
    private let bodyLabelView = BodyLabelView(textAlignment: .left)
    private let dismissButtonView = FilledButtonView(backgroundColor: .systemPink, title: "OK")
    private let parent: UIView
    private let message: DialogAlertMessage
    
    init(_ message: DialogAlertMessage, _ parent: UIView) {
        self.parent = parent
        self.message = message
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        parent.addSubview(self)
        setupContainerView()
        setupTitleLabelView()
        setupDismissButtonView()
        setupBodyLabelView()
    }
    
    private func setupContainerView() {
        backgroundColor = .systemBackground
        layer.cornerRadius = Radius.medium
        layer.borderWidth = Border.two
        layer.borderColor = UIColor.white.cgColor
        constraintContainerView()
    }
    
    private func setupTitleLabelView() {
        addSubview(titleLabelView)
        titleLabelView.text = message.title
        constraintTitleLabelView()
    }
    
    private func setupDismissButtonView() {
        addSubview(dismissButtonView)
        dismissButtonView.setTitle(message.buttonTitle, for: .normal)
        dismissButtonView.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        constraintDismissButtonView()
    }
    
    private func setupBodyLabelView() {
        addSubview(bodyLabelView)
        bodyLabelView.text = message.body
        bodyLabelView.numberOfLines = 4
        constraintBodyLabelView()
    }
    
    @objc private func dismiss() {
        delegate?.dialogViewDidDismiss()
    }
    
    private func constraintContainerView() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: parent.centerYAnchor),
            centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            widthAnchor.constraint(equalTo: parent.widthAnchor, multiplier: Factor.ninetyPercent),
            heightAnchor.constraint(equalTo: parent.heightAnchor, multiplier: Factor.thirtyPercent)
        ])
    }
    
    private func constraintTitleLabelView() {
        NSLayoutConstraint.activate([
            titleLabelView.topAnchor.constraint(equalTo: topAnchor, constant: Margin.medium),
            titleLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Margin.medium),
            titleLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Margin.medium),
            titleLabelView.heightAnchor.constraint(equalToConstant: FontSize.xxLarge)
        ])
    }
    
    private func constraintDismissButtonView() {
        NSLayoutConstraint.activate([
            dismissButtonView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Margin.medium),
            dismissButtonView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Margin.medium),
            dismissButtonView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Margin.medium),
            dismissButtonView.heightAnchor.constraint(equalToConstant: Size.small)
        ])
    }
    
    private func constraintBodyLabelView() {
        NSLayoutConstraint.activate([
            bodyLabelView.topAnchor.constraint(equalTo: titleLabelView.bottomAnchor, constant: Margin.medium),
            bodyLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Margin.medium),
            bodyLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Margin.medium),
            bodyLabelView.bottomAnchor.constraint(equalTo: dismissButtonView.topAnchor, constant: -Margin.medium)
        ])
    }
}
