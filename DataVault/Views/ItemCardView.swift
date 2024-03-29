//
//  CardView.swift
//  DataVault
//
//  Created by User on 28.03.2024.
//

import SwiftUI

struct ItemCardView: View {
    @StateObject var viewModel = ItemCardViewModel()
    
    let item: Card
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ZStack() {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .cornerRadius(10)
                    Text(item.title)
                        .font(.body)
                        //.frame(maxWidth: .infinity, alignment: .top)
                        .foregroundColor(.white)
                    VStack {
                       Spacer()
                            Text(item.cardHolderName)
                                .font(.body)
                                .foregroundColor(.white)
                        
                        
                    }
                    
                }
                Spacer()
            }
            .padding()
         }
    }
}



struct ItemCardView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCardView(item: .init(
            id: "111",
            title: "Sber",
            cardHolderName: "Danil Butakov",
            cardNumber: "5555-5555-5555-5555",
            experationDate: "05.28",
            ccvCode: "888",
            isDone: true
        ))
    }
}
