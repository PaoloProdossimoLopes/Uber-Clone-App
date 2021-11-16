//
//  UITextFIeld+Extension.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 15/11/21.
//

import Foundation
import UIKit

extension UITextField {
    
    static func configureLocationTextField(_ placeholder: String, alpha: CGFloat) -> UITextField {
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.textColor = .black
        tf.attributedPlaceholder = NSAttributedString(string: tf.placeholder ?? "",
                                                      attributes: [.foregroundColor: UIColor.darkGray])
        tf.keyboardType = .webSearch
        tf.backgroundColor = .lightGray.withAlphaComponent(alpha)
        
        let paddingView = UIView()
        paddingView.configureSize(width: 8)
        tf.leftView = paddingView
        tf.leftViewMode = .always
        
        return tf
    }
    
}
