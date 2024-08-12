//
//  ToDoListPasswordViewModel.swift
//  DataVault
//
//  Created by User on 18.03.2024.
//

import FirebaseFirestore
import Foundation

class ToDoListPasswordViewModel: ObservableObject {
    @Published var showingNewItemPasswordView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    //Delete to do list item password
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("usersPassword")
            .document(userId)
            .collection("todosPassword")
            .document(id)
            .delete()
    }
    
    //Update to do list item password
        func updateItem(_ item: ToDoListPassword) {
            let db = Firestore.firestore()
            db.collection("usersPassword")
                .document(userId)
                .collection("todosPassword")
                .document(item.id)
                .setData(item.asDictionary())
    }
}


