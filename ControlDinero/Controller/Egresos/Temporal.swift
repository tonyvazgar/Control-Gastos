//
//  Temporal.swift
//  ControlDinero
//
//  Created by Tony Vazgar on 29/09/20.
//  Copyright © 2020 Tony Vazgar. All rights reserved.
//

import UIKit

class Temporal: UIViewController {
    @IBOutlet weak var scollView: UIScrollView!
    
    override func viewDidLoad() {
        self.dismissKey()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    // MARK: Funciones de ObjectiveC para mostrar o ocultar keyboard cuando se escribe en labels
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scollView.contentInset = contentInset
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scollView.contentInset = contentInset
    }
}
