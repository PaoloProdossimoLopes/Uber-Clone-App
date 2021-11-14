//
//  SignUpViewModel.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 09/11/21.
//

import Foundation

protocol SignUpViewModelProtocol {
    func registerUserInFirebase(email: String?, password: String?, fullname: String?, index: Int, completion: @escaping ()->())
}

final class SignUpViewModel: SignUpViewModelProtocol {
    
    var auth: AuthServiceProtocol?
    
    func registerUserInFirebase(email: String?, password: String?, fullname: String?,
                                index: Int, completion: @escaping ()->()) {
        
        guard let email = email, let password = password, let fullname = fullname else { return }
        let user: User = .init(fullName: fullname, email: email, passwrod: password, segIndex: index)
        
        auth?.registerUser(user: user) { DispatchQueue.main.async { completion() } }
    }
    
}
