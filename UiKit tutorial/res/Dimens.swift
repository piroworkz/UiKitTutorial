//
//  Dimens.swift
//  UiKit tutorial
//
//  Created by David Luna on 23/02/25.
//

import Foundation

protocol Dimens {}

struct Margin: Dimens {
    static let zero: CGFloat = 0
    static let xSmall: CGFloat = 4
    static let small: CGFloat = 8
    static let medium: CGFloat = 16
    static let large: CGFloat = 24
    static let xLarge: CGFloat = 32
    static let xxLarge: CGFloat = 48
    static let xxxLarge: CGFloat = 64
}

struct Size: Dimens {
    static let small: CGFloat = 48
    static let medium: CGFloat = 64
    static let large: CGFloat = 96
    static let xLarge: CGFloat = 128
    static let xxLarge: CGFloat = 196
    static let xxxLarge: CGFloat = 256
}

struct Multiplier: Dimens {
    static let tenPercent: CGFloat = 0.1
    static let twentyPercent: CGFloat = 0.2
    static let thirtyPercent: CGFloat = 0.3
    static let fortyPercent: CGFloat = 0.4
    static let fiftyPercent: CGFloat = 0.5
    static let sixtyPercent: CGFloat = 0.6
    static let seventyPercent: CGFloat = 0.7
    static let eightyPercent: CGFloat = 0.8
    static let ninetyPercent: CGFloat = 0.9
    static let oneHundredPercent: CGFloat = 1
}

struct Ratio: Dimens {
    static let oneByTwo: CGFloat = 0.5
    static let oneByThree: CGFloat = 0.333
    static let oneByFour: CGFloat = 0.25
    static let oneByFive: CGFloat = 0.2
    static let eightbySeven : CGFloat = 0.857
}

struct FontSize {
    static let small: CGFloat = 12
    static let medium: CGFloat = 14
    static let large: CGFloat = 16
    static let xLarge: CGFloat = 18
    static let xxLarge: CGFloat = 24
    static let xxxLarge: CGFloat = 32
}

struct Border {
    static let one: CGFloat = 1
    static let two: CGFloat = 2
    static let three: CGFloat = 3
    static let four: CGFloat = 4
    static let five: CGFloat = 5
    static let six: CGFloat = 6
    static let seven: CGFloat = 7
    static let eight: CGFloat = 8
    static let nine: CGFloat = 9
    static let ten: CGFloat = 10
}
