//
//  Card.swift
//  DataVault
//
//  Created by User on 28.03.2024.
//

import Foundation

struct Card: Codable, Identifiable {
    let id: String
    let title: String
    let cardHolderName: String
    let cardNumber: String
    let experationDate: String
    let ccvCode: String
    
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
    
}
