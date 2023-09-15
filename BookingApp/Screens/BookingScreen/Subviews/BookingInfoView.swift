//
//  BookingInfoView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 15.09.2023.
//

import SwiftUI

struct BookingInfoView: View {
    
    @ObservedObject var viewModel: BookingScreenViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            infoRow(label: "booking_departure_from", value: viewModel.departure)
            infoRow(label: "booking_country_city", value: viewModel.arrivalCountry)
            infoRow(label: "booking_dates", value: viewModel.tourDates)
            infoRow(label: "booking_nights", value: viewModel.numberOfNights)
            infoRow(label: "booking_hotel", value: viewModel.hotelName)
            infoRow(label: "booking_room", value: viewModel.room)
            infoRow(label: "booking_food", value: viewModel.nutrition)
            
        }
        .systemRowModifier()
    }
    
    func infoRow(label: LocalizedStringKey, value: String) -> some View {
        HStack(alignment: .top) {
            Text(label)
                .foregroundColor(.contentSecondary)
                .frame(width: 150, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
            Text(value)
                .foregroundColor(.contentPrimary)
            Spacer()
        }
        .font(Font.custom(Fonts.regular, size: 16))
    }
}

struct BookingInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BookingInfoView(
            viewModel:
                .init(
                    bookingService: BookingService(),
                    navigationSubject: .init()
                )
        )
    }
}
