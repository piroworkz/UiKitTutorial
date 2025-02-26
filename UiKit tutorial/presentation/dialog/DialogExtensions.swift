//
//  DialogExtensions.swift
//  UiKit tutorial
//
//  Created by David Luna on 25/02/25.
//

import UIKit

extension UIViewController {
    
    func showDialog(title: String, body: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let message = DialogAlertMessage(title: title, body: body, buttonTitle: buttonTitle)
            let dialog = DialogViewController(message)
            dialog.modalPresentationStyle = .overFullScreen
            dialog.modalTransitionStyle = .crossDissolve
            self.present(dialog, animated: true)
        }
    }
    
}
