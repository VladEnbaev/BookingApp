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
    @FocusState private var isFocused
    private var isInvalid: Bool
    
    init(title: LocalizedStringKey, text: Binding<String>, isInvalid: Bool = false) {
        self.title = title
        self._text = text
        self.isInvalid = isInvalid
    }
    
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
        .background(isInvalid ? Color.invalidBackground.opacity(0.15) : Color.backgroundScreen)
        .cornerRadius(10)
    }
}

struct SystemTextField_Previews: PreviewProvider {
    static var previews: some View {
        SystemTextField(title: "PhoneNumber", text: .constant(""), isInvalid: true)
    }
}
