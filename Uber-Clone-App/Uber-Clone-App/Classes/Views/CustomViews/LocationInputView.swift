//
//  LocationInputViewController.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 11/11/21.
//

import UIKit

protocol LocationInputViewDelegate: AnyObject {
    func closeButtonHandleTapped()
}

final class LocationInputView: UIView {
    
    //MARK: - Propertie
    
    weak var delegate: LocationInputViewDelegate?
    
    private let backButton: UIButton = {
        let image = UIImage(systemName: "arrow.left")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(backButtonHandleTapped), for: .touchUpInside)
        return button
    }()
    
    private let userNameHeader: UILabel = {
        let label = UILabel()
        label.text = "Paolo P. Lopes"
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    private let fromLocationTextField: UITextField = .configureLocationTextField("Current location", alpha: 0.4)
    
    private let toLocationTextField: UITextField = .configureLocationTextField("To location", alpha: 0.8)
    
    private let lightSquare: UIView = .configureSquareOrDot(isSqare: true)
    private let darkDot: UIView = .configureSquareOrDot(isSqare: false)
    private let strateLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.configureSize(width: 1)
        return view
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        configureViewHierarchy()
        configureCostraints()
        
        self.addShadow()
        self.backgroundColor = .white
    }
    
    private func configureViewHierarchy() {
        [backButton, userNameHeader, lightSquare, strateLine,
         darkDot, fromLocationTextField, toLocationTextField].forEach { addSubview($0) }
    }
    
    private func configureCostraints() {
        backButton.configureContstaints(top: self.safeAreaLayoutGuide.topAnchor,
                                        leading: self.safeAreaLayoutGuide.leadingAnchor, paddingTop: 16,
                                        paddingLeading: 16, height: 36, width: 36)
        
        userNameHeader.configureContstaints(centerX: self.centerXAnchor, centerY: backButton.centerYAnchor)
        
        lightSquare.configureContstaints(top: backButton.bottomAnchor, centerX: backButton.centerXAnchor,
                                         paddingTop: 20)
        
        darkDot.configureContstaints(top: lightSquare.bottomAnchor, centerX: lightSquare.centerXAnchor,
                                     paddingTop: 30)
        
        strateLine.configureContstaints(top: lightSquare.bottomAnchor, bottom: darkDot.topAnchor,
                                        centerX: lightSquare.centerXAnchor, paddingTop: 5, paddingBottom: 5)
        
        fromLocationTextField.configureContstaints(leading: lightSquare.trailingAnchor,
                                                   trailing: self.trailingAnchor,
                                                   centerY: lightSquare.centerYAnchor,
                                                   paddingLeading: 20, paddingTrailing: 30, height: 30)
        
        toLocationTextField.configureContstaints(leading: fromLocationTextField.leadingAnchor,
                                                 trailing: fromLocationTextField.trailingAnchor,
                                                 centerY: darkDot.centerYAnchor, height: 30)
        
    }
    
    //MARK: - Selectors
    
    @objc private func backButtonHandleTapped() {
        DEBUGMessage("Back button tapped")
        delegate?.closeButtonHandleTapped()
    }
    
}

