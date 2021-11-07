//
//  UIButton+Extensions.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 07/11/21.
//

import UIKit

extension UIButton {
    
    static func createAccountCaptionButton() -> UIButton {
        let button = UIButton(type: .system)
        button.titleLabel?.textAlignment = .center
        
        let atributed = NSMutableAttributedString(string: "Don't have account?  ",
                                                  attributes: [.foregroundColor: UIColor.lightGray,
                                                               .font: UIFont.systemFont(ofSize: 14)])
        let secondAtributted = NSAttributedString(string: "Register",
                                                  attributes: [.foregroundColor: UIColor.white,
                                                               .font: UIFont.boldSystemFont(ofSize: 16)])
        atributed.append(secondAtributted)
        button.setAttributedTitle(atributed, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
}
