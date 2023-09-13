//
//  ButtonAccent.swift
//  BookingApp
//
//  Created by Влад Енбаев on 13.09.2023.
//

import SwiftUI

struct AccentButton: View {
    
    let text: LocalizedStringKey
    let action: () -> Void
    
    init(text: LocalizedStringKey, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundColor(.white)
                .font(.custom(Fonts.medium, size: 16))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 5)
        }
        .buttonStyle(.borderedProminent)
        .cornerRadius(15)
    }
}

struct AccentButton_Previews: PreviewProvider {
    static var previews: some View {
        AccentButton(text: "some", action: {})
    }
}
