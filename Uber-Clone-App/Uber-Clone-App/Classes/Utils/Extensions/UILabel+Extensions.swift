//
//  UILabel+Extensions.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 07/11/21.
//

import UIKit

extension UILabel {
    static func createUBERLogo(_ view: UIView) -> UILabel {
        let label = UILabel()
        label.text = "UBER"
        label.font = .boldSystemFont(ofSize: 36)
        label.textAlignment = .center
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        label.configureContstaints(top: view.safeAreaLayoutGuide.topAnchor,
                                   centerX: view.centerXAnchor, paddingTop: 30)
        
        return label
    }
    
    static func makeMyMarkDeveloper() -> UILabel {
        let label = UILabel()
        label.text = "Developped by Paolo"
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }
    
    static func configureUserNameLabel() -> UILabel {
        let label = UILabel()
        label.text = "Paolo Prodossimo Lopes"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }

}
