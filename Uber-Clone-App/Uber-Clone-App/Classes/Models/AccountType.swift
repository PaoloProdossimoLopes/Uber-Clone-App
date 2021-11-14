//
//  AccountType.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 09/11/21.
//

enum AccountType: Int, CaseIterable {
    case rider = 0
    case driver = 1
    
    var accountTypeDescription: String {
        switch self {
            case .rider: return "RIDER"
            case .driver: return "DRIVER"
        }
    }
    
}
