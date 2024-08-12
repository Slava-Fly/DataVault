//
//  ToDoListPassword.swift
//  DataVault
//
//  Created by User on 18.03.2024.
//

import Foundation

struct ToDoListPassword: Codable, Identifiable {
    let id: String
    var title: String
    var password: String
    
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}

