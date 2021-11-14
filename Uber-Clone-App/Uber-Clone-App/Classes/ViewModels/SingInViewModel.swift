//
//  SingUpViewModel.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 09/11/21.
//

import Foundation

protocol SingInViewModelProtocol {
    func signIn(email: String?, password: String?, completion: @escaping ()->())
}

final class SingInViewModel: SingInViewModelProtocol {
    
    var auth: AuthServiceProtocol?
    
    func signIn(email: String?, password: String?, completion: @escaping ()->()) {
        guard let email = email, let password = password,
        email.validateEmail() else { return }
        print("Is valid")
        auth?.signIn(email: email, password: password, completion: { completion() })
    }
    
}

