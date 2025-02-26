//
//  DialogViewController.swift
//  UiKit tutorial
//
//  Created by David Luna on 25/02/25.
//

import UIKit

class DialogViewController: UIViewController, DialogViewDelegate {
    
    private let message: DialogAlertMessage
    
    init(_ message: DialogAlertMessage) {
        self.message = message
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(Factor.seventyPercent)
        
        let dialogView = DialogView(message, view)
        
        dialogView.delegate = self
    }

    func dialogViewDidDismiss() {
        dismiss(animated: true)
    }
}
