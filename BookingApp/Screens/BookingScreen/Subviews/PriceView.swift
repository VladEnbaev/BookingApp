//
//  PriceView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 15.09.2023.
//

import SwiftUI

struct PriceView: View {
    @ObservedObject var viewModel: BookingScreenViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            infoRow(label: "booking_price_tour", value: viewModel.tourPrice)
            infoRow(label: "booking_price_fuel_charge", value: viewModel.fuelCharge)
            infoRow(label: "booking_price_service_charge", value: viewModel.serviceCharge)
            infoRow(label: "booking_price_total", value: viewModel.totalPrice, isBlueInfo: true)
        }
        .systemRowModifier()
    }
    
    func infoRow(label: LocalizedStringKey, value: String, isBlueInfo: Bool = false) -> some View {
        HStack(alignment: .top) {
            Text(label)
                .foregroundColor(.contentSecondary)
                .frame(width: 150, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
            Text(value)
                .foregroundColor(isBlueInfo ? .primaryAccentColor : .contentPrimary)
        }
        .font(Font.custom(Fonts.regular, size: 16))
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView(viewModel: .init(bookingService: BookingService(),
                                   navigationSubject: .init()))
    }
}
