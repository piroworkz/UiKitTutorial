//
//  TitleLabelView.swift
//  UiKit tutorial
//
//  Created by David Luna on 24/02/25.
//

import UIKit

class TitleLabelView: UILabel {
    
    init(textAlignment: NSTextAlignment, textSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = .systemFont(ofSize: textSize, weight: .bold)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = Factor.ninetyPercent
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
