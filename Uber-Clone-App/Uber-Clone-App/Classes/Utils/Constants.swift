//
//  Constants.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 09/11/21.
//

import FirebaseAuth
import FirebaseDatabase

//MARK: - Authentication

let AUTH = Auth.auth()

//MARK: - Data base

let DATA_BASE = Database.database().reference()
let DB_USERS = DATA_BASE.child("users")


