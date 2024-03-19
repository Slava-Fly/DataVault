//
//  ToDoListItemPasswordView.swift
//  DataVault
//
//  Created by User on 18.03.2024.
//

import SwiftUI

struct ToDoListItemPasswordView: View {
    @StateObject var viewModel = ToDoListItemPasswordViewModel()
    
    let item: ToDoListPassword
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text(item.password)
                    .font(.body)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct ToDoListItemPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemPasswordView(item: .init(
            id: "666",
            title: "Facebook", password: "Slava167",
            isDone: true
        ))
    }
}
