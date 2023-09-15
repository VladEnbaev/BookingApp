//
//  AddTouristView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 15.09.2023.
//

import SwiftUI

struct AddTouristView: View {
    
    let action: () -> Void
    
    var body: some View {
        HStack {
            Text("booking_add_torist")
                .font(.custom(Fonts.medium, size: 22))
                .foregroundColor(.contentPrimary)
            Spacer()
            AccentPlusButton(action: action)
        }
        .systemRowModifier()
    }
}

struct AddTouristView_Previews: PreviewProvider {
    static var previews: some View {
        AddTouristView(action: {})
    }
}
