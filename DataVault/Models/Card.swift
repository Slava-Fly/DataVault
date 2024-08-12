//
//  Card.swift
//  DataVault
//
//  Created by User on 28.03.2024.
//

import Foundation

struct Card: Codable, Identifiable {
    var id: String
    var title: String
    var cardHolderName: String
    var cardNumber: String
    var experationDate: String
    var ccvCode: String
    
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
