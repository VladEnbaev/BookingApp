//
//  BookimgScreenView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 15.09.2023.
//

import SwiftUI

struct BookingScreenView: View {
    
    @ObservedObject var viewModel: BookingScreenViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                hotelNameView
                BookingInfoView(viewModel: viewModel)
                BuyerInfoView()
            }
        }
        .background(Color.backgroundScreen)
        .onAppear {
            viewModel.getBookingInfo()
        }
    }
    
    var hotelNameView: some View {
        HotelNameView(
            rating: viewModel.rating,
            name: viewModel.hotelName,
            address: viewModel.hotelAddress
        )
        .systemRowModifier()
    }
    
    var buyerInfoView: some View {
        BuyerInfoView()
    }
}


struct BookingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        BookingScreenView(
            viewModel:
                BookingScreenViewModel(
                    bookingService: BookingService(),
                    navigationSubject: .init()
                )
        )
    }
}
