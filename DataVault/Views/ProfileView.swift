//
//  ProfileView.swift
//  Docs
//
//  Created by User on 10.03.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Загрузка профиля...")
                }
            }
            .navigationTitle("Профиль")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        //Info
        VStack(alignment: .leading) {
            HStack {
                Text("Имя: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Почта: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Дата Входа: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        
        //Sign out
        Button("Выйти") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
