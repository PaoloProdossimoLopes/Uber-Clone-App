//
//  SquaresViews.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 13/11/21.
//

import Foundation
import UIKit

final class SquaresViews: UIView {
    
    //MARK: - Properties
    
    private let OV = UIView()
    private let SV = UIView()
    private let TV = UIView()
    
    //MARK: - Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func commonInit() {
        configureUI()
        configureViewHierarchy()
        configureConstraints()
    }
    
    private func configureUI() {
        OV.backgroundColor = .lightGray
        SV.backgroundColor = .lightGray
        TV.backgroundColor = .black
    }
    
    private func configureViewHierarchy() {
        [OV, SV, TV].forEach { self.addSubview($0) }
    }
    
    private func configureConstraints() {
        OV.configureContstaints(top: self.topAnchor, centerX: self.centerXAnchor,
                                paddingTop: 10, height: 6, width: 6)
        
        SV.configureContstaints(top: OV.bottomAnchor, centerX: self.centerXAnchor,
                                paddingTop: 10, height: 10, width: 1)
        
        TV.configureContstaints(top: SV.bottomAnchor, centerX: self.centerXAnchor,
                                paddingTop: 10, height: 6, width: 6)
        
        self.configureContstaints(bottom: TV.bottomAnchor, paddingBottom: 20)
    }
    
}
