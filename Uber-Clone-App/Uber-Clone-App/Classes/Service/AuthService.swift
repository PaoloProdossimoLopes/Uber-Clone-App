//
//  AuthService.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 09/11/21.
//

import Foundation

protocol AuthServiceProtocol: AnyObject {
    func registerUser(user: User, completion: @escaping () -> ())
    func signIn(email: String, password: String, completion: @escaping ()->())
}

final class AuthService: AuthServiceProtocol {
    
    let DGroup: DispatchGroup = .init()
    
    //MARK: - Register new user
    
    func registerUser(user: User, completion: @escaping () -> ()) {
        DGroup.enter()
        registerInAuthForebase(user)
        DGroup.notify(queue: .global()) { completion() }
    }
    
    private func registerInAuthForebase(_ user: User) {
        AUTH.createUser(withEmail: user.email, password: user.passwrod) { result, error in
            guard let uid = result?.user.uid else { return }
            self.registerInDataBase(uid, user: user)
            self.DGroup.leave()
        }
    }
    
    private func registerInDataBase(_ UID: String, user: User) {
        let values: [String : Any] = ["email": user.email, "fullname": user.fullName,
                                      "AccountType": user.accountType, "password": user.passwrod]
        DGroup.enter()
        DB_USERS.child(UID).updateChildValues(values) { error, ref in self.DGroup.leave() }
    }
    
    //MARK: - Fetch old user
    
    func signIn(email: String, password: String, completion: @escaping ()->()) {
        AUTH.signIn(withEmail: email, password: password) { res, error in
            guard let _ = res, (error == nil) else { return }
            completion()
        }
    }
            
}
