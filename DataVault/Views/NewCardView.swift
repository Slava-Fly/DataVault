//
//  CardView.swift
//  DataVault
//
//  Created by User on 28.03.2024.
//

import SwiftUI

struct NewCardView: View {
    @StateObject var viewModel = NewCardViewViewModel()
    @Binding var newItemCardPresented: Bool
    
    var body: some View {
        Text("Новая карта")
            .font(.system(size: 32))
            .bold()
            .padding(.top, 100)
        VStack {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .padding()
                Spacer()
                Text("VISA")
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                    .italic()
                    .padding()
            }
            
            Text(viewModel.cardNumber.isEmpty ? " ": viewModel.cardNumber)
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .padding()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("CARD HOLDER")
                        .opacity(0.5)
                        .font(.system(size: 14))
                    Text(viewModel.cardHolderName.isEmpty ? " ": viewModel.cardHolderName)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("EXPIRES")
                        .opacity(0.5)
                        .font(.system(size: 14))
                    Text(viewModel.experationDate.isEmpty ? " ": viewModel.experationDate)
                }
                
                VStack(alignment: .listRowSeparatorLeading) {
                    Text("CCV")
                        .opacity(0.5)
                        .font(.system(size: 14))
                    Text(viewModel.ccvCode.isEmpty ? " ": viewModel.ccvCode)
                }
                
            }.padding()
            
            Spacer()
            
        }
        .foregroundStyle(.white)
        .frame(width: 350, height: 250)
        .background {
            LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        
        Form {
            TextField("Cardholder's Name", text: $viewModel.cardHolderName)
                .textFieldStyle(DefaultTextFieldStyle())
            TextField("Card Number", text: $viewModel.cardNumber)
                .textFieldStyle(DefaultTextFieldStyle())
            TextField("Expiry Date", text: $viewModel.experationDate)
                .textFieldStyle(DefaultTextFieldStyle())
            TextField("CCV", text: $viewModel.ccvCode)
                .textFieldStyle(DefaultTextFieldStyle())
            
            VStack {
                SettingsOfButton(title: "Сохранить", background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemCardPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding(.top, 50)
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Ошибка"),
                message: Text("Пожалуйста, заполните все поля")
            )
        }
    }
}


struct NewCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NewCardView(newItemCardPresented: Binding(get: {
                return true
            }, set: { _ in
    
            }))
        }
    }
}
