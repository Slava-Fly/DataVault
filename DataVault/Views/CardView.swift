//
//  CardView.swift
//  DataVault
//
//  Created by User on 28.03.2024.
//

import SwiftUI

import FirebaseFirestoreSwift
import SwiftUI

struct CardView: View {
    @StateObject var viewModel: CardViewModel
    @FirestoreQuery var items: [Card]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "usersCard/\(userId)/card")
        self._viewModel = StateObject(wrappedValue: CardViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ItemCardView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Карты")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showingNewItemCardView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemCardView) {
//                NewPasswordView(newItemPasswordPresented: $viewModel.showingNewItemPasswordView)
                NewCardView(newItemCardPresented: $viewModel.showingNewItemCardView)
            }
        }
    }
}
    
 
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(userId: "sKk1twQz1UahlQ8YjXcgdVlyPf82")
    }
}

