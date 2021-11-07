//
//  SingUpViewController.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 07/11/21.
//

import UIKit

final class SingUpViewController: UIViewController {
    
    //MARK: - Properties:
    
    private lazy var titleLabel: UILabel = .createUBERLogo(view)
    
    private let emailCustomTextField: CustomTextField = .init(placeholder: "Email ...", iconName: .email)
    private let fullnameCustomTextField: CustomTextField = .init(placeholder: "Fullname ...", iconName: .person)
    private let passwordCustomTextField: CustomTextField = .init(placeholder: "Password ...", iconName: .password)
    
    private let selectTypeAccount: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["Rider", "Driver"])
        seg.backgroundColor = .black
        seg.tintColor = .lightGray
        seg.selectedSegmentIndex = 0
        return seg
    }()
    
    private let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let registerButton = CustomPrimaryUIButton(title: "Register")
    
    private let developperLabel: UILabel = {
        let label = UILabel()
        label.text = "Developped by Paolo"
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        //Configure
        view.backgroundColor = .black
        navigationController?.navigationBar.tintColor = .lightGray
        
        //view hierarchy
        [emailCustomTextField, fullnameCustomTextField, passwordCustomTextField, selectTypeAccount]
            .forEach { mainStackView.addArrangedSubview($0) }
        [titleLabel, mainStackView, registerButton, developperLabel]
            .forEach { view.addSubview($0) }
        
        //constraints
        mainStackView.configureContstaints(top: titleLabel.bottomAnchor, leading: view.leadingAnchor,
                                           trailing: view.trailingAnchor, paddingTop: 20)
        registerButton.configureContstaints(top: mainStackView.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, centerX: view.centerXAnchor, paddingTop: 30, height: 50, width: 150)
        developperLabel.configureContstaints(bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                             centerX: view.centerXAnchor)
    }
    
    //MARK: - API
    
    //MARK: - Selectors
}
