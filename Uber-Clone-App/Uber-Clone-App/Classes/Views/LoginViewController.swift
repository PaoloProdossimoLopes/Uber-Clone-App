//
//  LoginController.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 07/11/21.
//

import UIKit

final class LoginController: UIViewController {
    
    //MARK: - Properties:
    
    private lazy var titleLabel: UILabel = .createUBERLogo(view)
    
    private let emailTextField = CustomTextField(placeholder: "Email", iconName: .email, type: .normal)
    private let passwordTextField = CustomTextField(placeholder: "Password", iconName: .password, type: .security)
    private let logginButton = CustomPrimaryUIButton(title: "Login")
    
    private let goToRegisterButton: UIButton = .createAccountCaptionButton()
    
    private let TFStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 25
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setNeedsStatusBarAppearanceUpdate() // call preferredStatusBarStyle
    }
    
    //Setup status bar white
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    //MARK: - Helpers
    
    private func configureUI() {
        
        // view hierarchy
        [emailTextField, passwordTextField].forEach { TFStackView.addArrangedSubview($0) }
        [TFStackView, logginButton, goToRegisterButton].forEach { view.addSubview($0) }
        
        
        //constraints
        TFStackView.configureContstaints(top: titleLabel.bottomAnchor,
                                         leading: view.leadingAnchor,
                                         trailing: view.trailingAnchor,
                                         paddingTop: 50,  paddingLeading: 20,
                                         paddingTrailing: 20)
        
        logginButton.configureContstaints(top: TFStackView.bottomAnchor, leading: TFStackView.leadingAnchor,
                                          trailing: TFStackView.trailingAnchor, paddingTop: 30, height: 50)
        
        goToRegisterButton.configureContstaints(leading: view.leadingAnchor, trailing: view.trailingAnchor,
                                                bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                                paddingLeading: 20, paddingTrailing: 20, paddingBottom: 10)
        
        
        //configure
        view.backgroundColor = .black
        
        logginButton.delegate = self
        goToRegisterButton.addTarget(self, action: #selector(goToRegisterButtonHandleTapped), for: .touchUpInside)
        
    }
    
    //MARK: - API
    
    //MARK: - Selectors
    
    @objc private func goToRegisterButtonHandleTapped() {
        print("Go to register")
        let vc = SingUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
     
}

//MARK: - Extension: CustomPrimaryButtonDelegate
extension LoginController: CustomPrimaryButtonDelegate {
    func buttonHandleTapped() {
        print("Tapped")
        view.endEditing(true)
    }
}
