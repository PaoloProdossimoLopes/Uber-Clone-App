//
//  LoginController.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 07/11/21.
//

import UIKit
import FirebaseAuth

final class SignInViewController: UIViewController {
    
    //MARK: - Properties:
    
    var viewModel: SingInViewModelProtocol?
    
    private lazy var titleLabel: UILabel = .createUBERLogo(view)
    
    private let emailTextField = CustomTextField(placeholder: "Email", iconName: .email, type: .normal)
    private let passwordTextField = CustomTextField(placeholder: "Password", iconName: .password, type: .security)
    private let logginButton = CustomPrimaryUIButton(title: "Login")
    
    private let goToRegisterButton: UIButton = .createAccountCaptionButton()
    
    private let TFStackView: UIStackView = .configureDefaultVerticalStackView()
    
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
        
        configureViewHierarchy()
        configureConstraints()

        view.backgroundColor = .black
        
        logginButton.delegate = self
        goToRegisterButton.addTarget(self, action: #selector(goToRegisterButtonHandleTapped), for: .touchUpInside)
        
    }
    
    private func configureViewHierarchy() {
        [emailTextField, passwordTextField].forEach { TFStackView.addArrangedSubview($0) }
        [TFStackView, logginButton, goToRegisterButton].forEach { view.addSubview($0) }
    }
    
    private func configureConstraints() {
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
    }
    
    private func goToHome() {
        let vc = UberRouter.routeToHomeMapVC()
        present(vc, animated: true, completion: nil)
    }
    
    
    //MARK: - API
    
    private func login(completion: @escaping ()->()) {
        viewModel?.signIn(email: emailTextField.getText(), password: passwordTextField.getText()) {
            completion()
        }
    }
    
    //MARK: - Selectors
    
    @objc private func goToRegisterButtonHandleTapped() {
        print("Go to register")
        let vc = UberRouter.routeToSingUpVC()
        navigationController?.pushViewController(vc, animated: true)
    }
     
}

//MARK: - Extension: CustomPrimaryButtonDelegate
extension SignInViewController: CustomPrimaryButtonDelegate {
    func buttonHandleTapped() {
        view.endEditing(true)
        login { self.goToHome() }
    }
}

//MARK: - Root viewController

//guard let controller = UIApplication.shared.keyWindow?.rootViewController as? HomeMapViewController else { return }
//controller.configureUI()
