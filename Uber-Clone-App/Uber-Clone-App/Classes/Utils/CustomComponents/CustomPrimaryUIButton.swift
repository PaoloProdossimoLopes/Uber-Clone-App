//
//  CustomPrimaryUIButton.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 07/11/21.
//

import UIKit

protocol CustomPrimaryButtonDelegate: AnyObject {
    func buttonHandleTapped()
}

final class CustomPrimaryUIButton: UIButton {
    
    weak var delegate: CustomPrimaryButtonDelegate?
    
    private let buttonTitle: String
    
    init(title: String) {
        self.buttonTitle = title
        super.init(frame: .zero)
        
        configureUIButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUIButton() {
        backgroundColor = .lightGray
        setTitle(buttonTitle, for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 16)
        layer.cornerRadius = 5
        translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(self, action: #selector(buttonHandleTapped), for: .touchUpInside)
    }
    
    @objc private func buttonHandleTapped() {
        delegate?.buttonHandleTapped()
    }
    
}
