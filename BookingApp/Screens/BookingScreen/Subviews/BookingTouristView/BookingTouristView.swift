//
//  BiikingTouristView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 15.09.2023.
//

import SwiftUI

struct BookingTouristView: View {
    
    @ObservedObject var viewModel: BookingTouristViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            labelView
            if viewModel.isOpen {
                VStack(spacing: 8) {
                    SystemTextField(
                        title: "booking_tourist_name",
                        text: $viewModel.name,
                        isInvalid: viewModel.isInvalidName
                    )
                    SystemTextField(
                        title: "booking_tourist_surname",
                        text: $viewModel.surname,
                        isInvalid: viewModel.isInvalidSurname
                    )
                    SystemTextField(
                        title: "booking_tourist_birthday",
                        text: $viewModel.dateOfBirth,
                        isInvalid: viewModel.isInvalidDateOfBirth
                    )
                    SystemTextField(
                        title: "booking_tourist_citizenship",
                        text: $viewModel.citizenship,
                        isInvalid: viewModel.isInvalidCitizenship
                    )
                    SystemTextField(
                        title: "booking_tourist_passport",
                        text: $viewModel.passportNumber,
                        isInvalid: viewModel.isInvalidPassportNumber
                    )
                    SystemTextField(
                        title: "booking_tourist_passport_date",
                        text: $viewModel.passportExpirationDate,
                        isInvalid: viewModel.isInvalidPassportExpirationDate
                    )
                }
            }
        }
        .systemRowModifier()
    }
    
    var labelView: some View {
        HStack {
            Group {
                Text(viewModel.title) + Text(" ") + Text("booking_tourist")
            }
            .font(.custom(Fonts.medium, size: 22))
            .foregroundColor(.contentPrimary)
            Spacer()
            ChevronButton(isOpen: $viewModel.isOpen)
        }
    }
    
}

struct BiikingTouristView_Previews: PreviewProvider {
    static var previews: some View {
        BookingTouristView(viewModel: .init(number: .first))
    }
}
