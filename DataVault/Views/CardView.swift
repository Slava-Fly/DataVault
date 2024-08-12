//
//  CardView.swift
//  DataVault
//
//  Created by User on 28.03.2024.
//


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
                    NavigationLink(destination: CardDetailView(card: item)) {
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
            }
            .navigationTitle("Карты")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showingNewItemCardView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            .sheet(isPresented: $viewModel.showingNewItemCardView) {
                NewCardView(newItemCardPresented: $viewModel.showingNewItemCardView)
            }
        }
    }
}

struct CardDetailView: View {
    @State var card: Card
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Card Name")) {
                    TextField("Card Name", text: $card.title)
                        .textFieldStyle(DefaultTextFieldStyle())
                }
                
                Section(header: Text("Cardholder's Name")) {
                    TextField("Cardholder's Name", text: $card.cardHolderName)
                        .textFieldStyle(DefaultTextFieldStyle())
                }
                
                Section(header: Text("Card Number")) {
                    TextField("Card Number", text: $card.cardNumber)
                        .textFieldStyle(DefaultTextFieldStyle())
                }
                
                Section(header: Text("Expiry Date")) {
                    TextField("Expiry Date", text: $card.experationDate)
                        .textFieldStyle(DefaultTextFieldStyle())
                }
                
                Section(header: Text("CCV")) {
                    TextField("CCV", text: $card.ccvCode)
                        .textFieldStyle(DefaultTextFieldStyle())
                }
            }
        }
        .navigationTitle("Детали Карты")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(userId: "sKk1twQz1UahlQ8YjXcgdVlyPf82")
    }
}

