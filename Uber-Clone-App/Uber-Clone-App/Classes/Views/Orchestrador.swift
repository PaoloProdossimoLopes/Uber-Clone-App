//
//  Orchestrador.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 09/11/21.
//

import UIKit
import FirebaseAuth

typealias OrchestradorInheritanceTA = (UIViewController & OrchestradorProtocol)

protocol OrchestradorProtocol {
    func checkIfUserIsLoggedIn()
}

final class Orchestrador: OrchestradorInheritanceTA {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.checkIfUserIsLoggedIn()
    }
    
    func checkIfUserIsLoggedIn() {
        if AUTH.currentUser?.uid == nil {
            DispatchQueue.main.async { self.goToSignIn() }
        } else {
            DispatchQueue.main.async { self.goToHome() }
        }
    }
    
    private func goToSignIn() {
        let nav = UberRouter.routeToSingInNav()
        DEBUGMessage("Go to Sign in")
        present(nav, animated: true, completion: nil)
    }
    
    private func goToHome() {
        let vc = UberRouter.routeToHomeMapVC()
        DEBUGMessage("Go to Home")
        present(vc, animated: true, completion: nil)
    }
    
}
