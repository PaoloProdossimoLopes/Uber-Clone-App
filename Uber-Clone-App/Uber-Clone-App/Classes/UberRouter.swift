//
//  UberRouter.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 09/11/21.
//

import UIKit

enum UberRouter {
    
    static func routeToSingInNav() -> UINavigationController {
        let vc = SignInViewController()
        let vm = SingInViewModel()
        let auth = AuthService()
        
        vm.auth = auth
        vc.viewModel = vm
        
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        return nav
    }
    
    static func routeToSingUpVC() -> UIViewController {
        let vc = SingUpViewController()
        let vm = SignUpViewModel()
        let auth = AuthService()
        
        vm.auth = auth
        vc.viewModel = vm
        
        return vc
    }
    
    static func routeToHomeMapVC() -> UIViewController {
        let vc = HomeMapViewController()
        vc.modalPresentationStyle = .fullScreen
        
        return vc
    }
    
}
