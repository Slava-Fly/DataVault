//
//  CardView.swift
//  DataVault
//
//  Created by User on 28.03.2024.
//

import SwiftUI

struct ItemCardView: View {
    let item: Card
    
    var body: some View {
        
        ZStack {
            HStack {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
            
            HStack {
                Text(item.cardHolderName)
                    .font(.body)
                    .foregroundColor(.gray)
            }
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
