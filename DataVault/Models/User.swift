//
//  User.swift
//  Docs
//
//  Created by User on 10.03.2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
