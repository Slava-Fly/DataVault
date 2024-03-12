//
//  DocsApp.swift
//  Docs
//
//  Created by User on 10.03.2024.
//

import FirebaseCore
import SwiftUI

@main
struct DocsApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
