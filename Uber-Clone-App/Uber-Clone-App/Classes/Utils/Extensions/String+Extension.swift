//
//  String+Extension.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 10/11/21.
//

import Foundation

extension String {
    
    func validateEmail() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@",emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
//    func isValidPassword() -> Bool {
//        // least one uppercase,
//        // least one digit
//        // least one lowercase
//        // least one symbol
//        //  min 8 characters total
//        let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
//        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
//        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
//        return passwordCheck.evaluate(with: password)
//
//    }
    
}
