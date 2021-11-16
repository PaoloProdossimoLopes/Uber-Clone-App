//
//  UIView+Extensions.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 07/11/21.
//

import UIKit

extension UIView {
    
    static func configureSquareOrDot(isSqare: Bool) -> UIView {
        let view = UIView()
        view.backgroundColor = .lightGray
        if !isSqare { view.layer.cornerRadius = 8/2
                      view.backgroundColor = .black
                      view.configureSize(height: 8, width: 8) }
        else { view.configureSize(height: 6, width: 6) }
        return view
    }
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        self.layer.masksToBounds = false
        self.layer.masksToBounds = false
    }
    
    func configureContstaints(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil,
                              trailing: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil,
                              centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil,
                              paddingTop: CGFloat? = nil, paddingLeading: CGFloat? = nil,
                              paddingTrailing: CGFloat? = nil, paddingBottom: CGFloat? = nil,
                              height: CGFloat? = nil, width: CGFloat? = nil) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            if let padding = paddingTop {
                self.topAnchor.constraint(equalTo: top, constant: padding).isActive = true
            } else {
                self.topAnchor.constraint(equalTo: top).isActive = true
            }
            
        }; if let leading = leading {
            if let padding = paddingLeading {
                self.leadingAnchor.constraint(equalTo: leading, constant: padding).isActive = true
            } else {
                self.leadingAnchor.constraint(equalTo: leading).isActive = true
            }
            
        }; if let trailing = trailing {
            if let padding = paddingTrailing {
                self.trailingAnchor.constraint(equalTo: trailing, constant: -padding).isActive = true
            } else {
                self.trailingAnchor.constraint(equalTo: trailing).isActive = true
            }
            
        }; if let bottom = bottom {
            if let padding = paddingBottom {
                self.bottomAnchor.constraint(equalTo: bottom, constant: -padding).isActive = true
            } else {
                self.bottomAnchor.constraint(equalTo: bottom).isActive = true
            }
        }; if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
            
        }; if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        self.configureSize(height: height, width: width)
    }
    
    func configureSize(height: CGFloat? = nil, width: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }; if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
}
