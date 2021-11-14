//
//  SingUpViewController.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 07/11/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

final class SingUpViewController: UIViewController {
    
    //MARK: - Properties:
    
    var viewModel: SignUpViewModelProtocol?
    
    private lazy var titleLabel: UILabel = .createUBERLogo(view)
    
    private let emailCustomTextField: CustomTextField = .init(placeholder: "Email ...", iconName: .email)
    private let fullnameCustomTextField: CustomTextField = .init(placeholder: "Fullname ...", iconName: .person)
    private let passwordCustomTextField: CustomTextField = .init(placeholder: "Password ...", iconName: .password)
    
    private let selectTypeAccount: UISegmentedControl = .configureTypeAccount()
    private let mainStackView: UIStackView = .configureDefaultVerticalStackView()
    
    private let registerButton = CustomPrimaryUIButton(title: "Register")
    private let developperLabel: UILabel = .makeMyMarkDeveloper()
    
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
        
        registerButton.delegate = self
        
        configureViewHierarchy()
        configureConstraints()
        
    }
    
    private func configureViewHierarchy() {
        [emailCustomTextField, fullnameCustomTextField, passwordCustomTextField, selectTypeAccount]
            .forEach { mainStackView.addArrangedSubview($0) }
        [titleLabel, mainStackView, registerButton, developperLabel]
            .forEach { view.addSubview($0) }
    }
    
    private func configureConstraints() {
        mainStackView.configureContstaints(top: titleLabel.bottomAnchor, leading: view.leadingAnchor,
                                           trailing: view.trailingAnchor, paddingTop: 20)
        registerButton.configureContstaints(top: mainStackView.bottomAnchor, leading: view.leadingAnchor,
                                            trailing: view.trailingAnchor, centerX: view.centerXAnchor,
                                            paddingTop: 30, height: 50, width: 150)
        developperLabel.configureContstaints(bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                             centerX: view.centerXAnchor)
    }
    
    private func goToHome() {
        let vc = UberRouter.routeToHomeMapVC()
        present(vc, animated: true, completion: nil)
    }
    
    //MARK: - API
    
    private func authenticateUser() {
        viewModel?.registerUserInFirebase(
            email: emailCustomTextField.getText(),
            password: passwordCustomTextField.getText(),
            fullname: fullnameCustomTextField.getText(),
            index: selectTypeAccount.selectedSegmentIndex,
            completion: { DispatchQueue.main.async { self.goToHome() } })
    }
    
}

extension SingUpViewController: CustomPrimaryButtonDelegate {
    func buttonHandleTapped() {
        view.endEditing(true)
        self.authenticateUser()
    }
}
