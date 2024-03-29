//
//  NewPasswordView.swift
//  DataVault
//
//  Created by User on 18.03.2024.
//

import SwiftUI

struct NewPasswordView: View {
    @StateObject var viewModel = NewPasswordViewModel()
    @Binding var newItemPasswordPresented: Bool
    
    var body: some View {
        VStack {
            Text("Новый пароль")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 20)
            
            Form {
                TextField("Аккаунт", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Пароль", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    Spacer(minLength: 350)
                VStack {
                    SettingsOfButton(title: "Сохранить", background: .pink) {
                        if viewModel.canSave {
                            viewModel.save()
                            newItemPasswordPresented = false
                        } else {
                            viewModel.showAlert = true
                        }
                    }
                    //.padding(.top)
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Ошибка"),
                    message: Text("Пожалуйста, заполните все поля и выберите дату")
                )
            }
        }
    }
}

struct NewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NewPasswordView(newItemPasswordPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
