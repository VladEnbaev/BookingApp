//
//  BiikingTouristView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 15.09.2023.
//

import SwiftUI

struct BookingTouristView: View {
    
    var label: LocalizedStringKey
    
    @State private var name = ""
    @State private var surname = ""
    @State private var dateOfBirth = ""
    @State private var citizenship = ""
    @State private var passportNumber = ""
    @State private var passportExpirationDate = ""
    
    @State private var isOpen = false
    
    var body: some View {
        VStack(spacing: 20) {
            labelView
            if isOpen {
                VStack(spacing: 8) {
                    SystemTextField(title: "booking_tourist_name", text: $name)
                    SystemTextField(title: "booking_tourist_surname", text: $surname)
                    SystemTextField(title: "booking_tourist_birthday", text: $dateOfBirth)
                    SystemTextField(title: "booking_tourist_citizenship", text: $citizenship)
                    SystemTextField(title: "booking_tourist_passport", text: $passportNumber)
                    SystemTextField(title: "booking_tourist_passport_date", text: $passportExpirationDate)
                }
            }
            
        }
        .systemRowModifier()
    }
    
    var labelView: some View {
        HStack {
            Text(label)
                .font(.custom(Fonts.medium, size: 22))
                .foregroundColor(.contentPrimary)
            Spacer()
            ChevronButton(isOpen: $isOpen)
        }
    }
    
}

struct BiikingTouristView_Previews: PreviewProvider {
    static var previews: some View {
        BookingTouristView(label: "Первый турист")
    }
}
