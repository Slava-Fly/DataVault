//
//  NewCardViewViewModel.swift
//  DataVault
//
//  Created by User on 28.03.2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewCardViewViewModel: ObservableObject {
    @Published var cardHolderName: String = ""
    @Published var title: String = ""
    @Published var cardNumber: String = ""
    @Published var experationDate: String = ""
    @Published var ccvCode: String = ""
    @Published var showAlert = false
    
    var canSave: Bool {
        guard !cardHolderName.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard !cardNumber.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard !experationDate.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard !ccvCode.trimmingCharacters(in: .whitespaces).isEmpty else {
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
        let newItem = Card(
            id: newId,
            title: title,
            cardHolderName: cardHolderName,
            cardNumber: cardNumber,
            experationDate: experationDate,
            ccvCode: ccvCode,
            isDone: false
        )
        
        //Save model
        let db = Firestore.firestore()
        db.collection("usersCard")
            .document(uId)
            .collection("card")
            .document(newId)
            .setData(newItem.asDictionary())
    }
}
