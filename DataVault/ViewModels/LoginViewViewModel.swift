//
//  LoginViewViewModel.swift
//  Docs
//
//  Created by User on 10.03.2024.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        //Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    //Validation of user
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Пожалуйста, заполните все поля"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Пожалуйста, заполните все поля"
            return false
        }
        
        return true
    }
}
