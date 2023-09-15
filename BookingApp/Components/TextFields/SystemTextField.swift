//
//  ystemTextField.swift
//  BookingApp
//
//  Created by Влад Енбаев on 15.09.2023.
//

import SwiftUI

struct SystemTextField: View {
    
    var title: LocalizedStringKey
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.custom(Fonts.regular, size: 12))
                .foregroundColor(.contentSecondary)
            TextField("UserName", text: $text)
                .font(.custom(Fonts.regular, size: 16))
                .foregroundColor(.contentPrimary)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color.backgroundScreen)
        .cornerRadius(10)
    }
}

struct SystemTextField_Previews: PreviewProvider {
    static var previews: some View {
        SystemTextField(title: "PhoneNumber", text: .constant("+7952812"))
    }
}
