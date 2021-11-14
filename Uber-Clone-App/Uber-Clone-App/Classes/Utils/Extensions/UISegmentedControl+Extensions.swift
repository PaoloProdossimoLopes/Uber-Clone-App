//
//  UISegmentedControl+Extensions.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 07/11/21.
//

import UIKit

extension UISegmentedControl {
    static func configureTypeAccount() -> UISegmentedControl {
        let seg = UISegmentedControl(items: ["Rider", "Driver"])
        seg.backgroundColor = .black
        seg.tintColor = .lightGray
        seg.selectedSegmentIndex = 0
        return seg
    }
}
