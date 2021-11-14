//
//  User.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 09/11/21.
//

struct User {
    
    let fullName: String
    let email: String
    let passwrod: String
    let segIndex: Int
    
    var type: AccountType {
        switch segIndex {
            case 0: return .rider
            case 1: return .driver
            default: return .rider
        }
    }
    
    var accountType: String {
        return type.accountTypeDescription
    }
    
}
