//
//  CardViewModel.swift
//  DataVault
//
//  Created by User on 28.03.2024.
//

import FirebaseFirestore
import Foundation

class CardViewModel: ObservableObject {
    @Published var showingNewItemCardView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    //Delete card
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("usersCard")
            .document(userId)
            .collection("card")
            .document(id)
            .delete()
    }
}
