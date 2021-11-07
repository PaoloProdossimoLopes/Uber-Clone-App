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

}
