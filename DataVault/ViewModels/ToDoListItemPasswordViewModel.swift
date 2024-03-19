//
//  ToDoListItemPasswordViewModel.swift
//  DataVault
//
//  Created by User on 18.03.2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemPasswordViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: ToDoListPassword) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("usersPassword")
            .document(uid)
            .collection("todosPassword")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
