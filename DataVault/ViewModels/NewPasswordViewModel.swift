//
//  NewPasswordViewModel.swift
//  DataVault
//
//  Created by User on 18.03.2024.


import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewPasswordViewModel: ObservableObject {
    @Published var title = ""
    @Published var password = ""
    @Published var showAlert = false
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
    }
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        //Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        //Create model
        let newId = UUID().uuidString
        let newItem = ToDoListPassword(
            id: newId,
            title: title,
            password: password,
            isDone: false
            )
        
        //Save model
        let db = Firestore.firestore()
        db.collection("usersPassword")
            .document(uId)
            .collection("todosPassword")
            .document(newId)
            .setData(newItem.asDictionary())
    }
}
