//
//  ItemCardViewModel.swift
//  DataVault
//
//  Created by User on 28.03.2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ItemCardViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: CardView) {
        var itemCopy = item
        //itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
//        let db = Firestore.firestore()
//        db.collection("usersCard")
//            .document(uid)
//            .collection("card")
//            .document(itemCopy.id)
//            .setData(itemCopy.asDictionary())
    }
}
