//
//  ContentView.swift
//  Docs
//
//  Created by User on 10.03.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            CardView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Карта", systemImage: "creditcard.fill")
                }
            
            ToDoListPasswordView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Пароль", systemImage: "key")
                }
            
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Заметка", systemImage: "note.text")
                }
            
            ProfileView()
                .tabItem {
                    Label("Профиль", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
