//
//  CustomTextField.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 07/11/21.
//

import UIKit

enum TextFieldIconsOptins: String,  CaseIterable {
    case email = "envelope.fill"
    case password = "lock.fill"
    case person = "person.fill"
}

enum TextFieldTypeOptions: CaseIterable {
    case normal
    case security
}

final class CustomTextField: UIView {
    
    //MARK: - Properties:
    
    private let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.contentMode = .scaleToFill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private let icon: UIImageView = UIImageView()
    
    private let customTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = .systemFont(ofSize: 16)
        tf.textColor = .white
        tf.keyboardAppearance = .dark
        tf.placeholder = "Digite seu email aqui"
        tf.attributedPlaceholder = NSAttributedString(string: tf.placeholder ?? "",
                                                      attributes: [.foregroundColor: UIColor.lightGray])
        return tf
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    //MARK: - Init
    
    init(placeholder: String, iconName: TextFieldIconsOptins, type: TextFieldTypeOptions = .normal) {
        customTextField.placeholder = placeholder
        self.icon.image = UIImage(systemName: iconName.rawValue)?
            .withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        
        super.init(frame: .zero)
        
        if (type == .security || iconName == .password) { (customTextField.isSecureTextEntry = true) }
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        configureViewHierarchy()
        configureContraints()
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureViewHierarchy() {
        [icon, customTextField].forEach { containerStackView.addArrangedSubview($0) }
        [containerStackView, divider].forEach { mainStackView.addArrangedSubview($0) }
        self.addSubview(mainStackView)
    }
    
    private func configureContraints() {
        icon.configureSize(height: 26, width: 30)
        divider.configureSize(height: 1)
        
        mainStackView.configureContstaints(top: self.topAnchor, leading: self.leadingAnchor,
                                           trailing: self.trailingAnchor)
        
        self.configureContstaints(bottom: mainStackView.bottomAnchor)
        customTextField.delegate = self
    }
    
    //MARK: - Selectors
    
    
    
}

extension CustomTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { endEditing(true); return true }
}
