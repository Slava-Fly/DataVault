//
//  SettingsOfButton.swift
//  Docs
//
//  Created by User on 10.03.2024.
//

import SwiftUI

struct SettingsOfButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

struct SettingsOfButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsOfButton(title: "Value",
                         background: .pink) {
        }
    }
}
