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
    @FocusState var isFocused
    
    private var isExtended: Bool {
        isFocused || !text.isEmpty
    }
    
    private var prompt: Text? {
        if isFocused {
            return nil
        } else {
            return Text(title).foregroundColor(.contentSecondary)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if isExtended {
                Text(title)
                    .font(.custom(Fonts.regular, size: 12))
                    .foregroundColor(.contentSecondary)
            }
            TextField("", text: $text, prompt: prompt)
                .font(.custom(Fonts.regular, size: isExtended ? 16 : 17))
                .foregroundColor(.contentPrimary)
                .focused($isFocused)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, isExtended ? 10 : 16)
        .background(Color.backgroundScreen)
        .cornerRadius(10)
    }
}

struct SystemTextField_Previews: PreviewProvider {
    static var previews: some View {
        SystemTextField(title: "PhoneNumber", text: .constant(""))
    }
}
