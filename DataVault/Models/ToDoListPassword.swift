//
//  ToDoListPassword.swift
//  DataVault
//
//  Created by User on 18.03.2024.
//

import Foundation

struct ToDoListPassword: Codable, Identifiable {
    let id: String
    let title: String
    let password: String
    
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
