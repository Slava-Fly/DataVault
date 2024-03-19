//
//  LoginView.swift
//  Docs
//
//  Created by User on 10.03.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView() {
            VStack {
                //Header
                HeaderView(title: "DataVault",
                           subtitle: "Get things done",
                           angle: 15,
                           background: .pink)
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
                
                //Login form
                Form {
                    TextField("Почта", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Пароль", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    SettingsOfButton(
                        title: "Войти",
                        background: .blue) {
                            viewModel.login()
                        }
                    .padding()
                }
                .offset(y: -50)
                
                //Create account
                VStack {
                    Text("Новый пользователь?")
                    
                    NavigationLink("Создать аккаунт",
                    destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
