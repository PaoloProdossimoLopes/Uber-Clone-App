//
//  InputLocationViewHeader.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 13/11/21.
//

import UIKit

protocol InputLocationViewHeaderDelegate: AnyObject {
    func closeButtonHandleTapped()
}

final class InputLocationViewHeader: UIView {
    
    weak var delegate: InputLocationViewHeaderDelegate?
    
    private lazy var closeButton: UIButton = .configureCloseButton()
    private lazy var titleLabel: UILabel = .configureUserNameLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        configureViewHierarchy()
        configureConstraints()
        
        closeButton.addTarget(self, action: #selector(closeButtonHandleTapped), for: .touchUpInside)
    }
    
    private func configureViewHierarchy() {
        [closeButton, titleLabel].forEach { addSubview($0) }
    }
    
    private func configureConstraints() {
        closeButton.configureContstaints(top: topAnchor, leading: leadingAnchor,
                                         paddingTop: 20, paddingLeading: 20)
        
        titleLabel.configureContstaints(top: topAnchor, centerX: centerXAnchor)
    }
    
    @objc private func closeButtonHandleTapped() {
        delegate?.closeButtonHandleTapped()
    }
    
}
