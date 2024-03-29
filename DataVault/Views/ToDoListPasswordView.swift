//
//  ToDoListPasswordView.swift
//  DataVault
//
//  Created by User on 18.03.2024.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListPasswordView: View {
    @StateObject var viewModel: ToDoListPasswordViewModel
    @FirestoreQuery var items: [ToDoListPassword]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "usersPassword/\(userId)/todosPassword")
        self._viewModel = StateObject(wrappedValue: ToDoListPasswordViewModel(userId: userId))
    }
    
//    func move(from source: IndexSet, to destanation: Int) {
//        items.move(fromOffsets: source, toOffset: destanation)
//    }
//
//    func deleteItem(at offsets: IndexSet) {
//        items.remove(atOffsets: offsets)
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    NavigationLink(destination: NewPasswordView(newItemPasswordPresented: $viewModel.showingNewItemPasswordView)) {
                        ToDoListItemPasswordView(item: item)
                            .swipeActions {
                                Button("Delete") {
                                    viewModel.delete(id: item.id)
                                }
                                .tint(.red)
                            }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Пароли")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showingNewItemPasswordView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemPasswordView) {
                NewPasswordView(newItemPasswordPresented: $viewModel.showingNewItemPasswordView)
            }
        }
    }
}
    
 
struct ToDoListPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListPasswordView(userId: "sKk1twQz1UahlQ8YjXcgdVlyPf82")
    }
}
