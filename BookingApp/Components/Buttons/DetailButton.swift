//
//  DetailButton.swift
//  BookingApp
//
//  Created by Влад Енбаев on 14.09.2023.
//

import SwiftUI

struct DetailButton: View {
    
    let text: LocalizedStringKey
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            label
        }
    }
    
    var label: some View {
        HStack(alignment: .center, spacing: 2) {
            Text(text)
                .font(.custom(Fonts.medium, size: 16))
            Image(Assets.Icons.rightArrow)
                .renderingMode(.template)
                .resizable()
                .frame(width: 24, height: 24)
        }
        .foregroundColor(.primaryAccentColor)
        .padding(.leading, 10)
        .padding(.trailing, 2)
        .padding(.vertical, 2.5)
        .background(Color.accentBackground)
        .cornerRadius(5)
    }
}

struct DetailButton_Previews: PreviewProvider {
    static var previews: some View {
        DetailButton(text: "rooms_detail_button", action: { })
    }
}
