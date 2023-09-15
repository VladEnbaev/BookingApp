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
        NavigationView {
            ScrollView {
                VStack(spacing: 8) {
                    hotelNameView
                    BookingInfoView(viewModel: viewModel)
                    BuyerInfoView()
                    BookingTouristView(label: "Первый турист")
                    BookingTouristView(label: "Второй турист")
                    AddTouristView(action: { })
                    PriceView(viewModel: viewModel)
                }
                .padding(.top, 55)
                .padding(.bottom, 8)
            }
            .background(Color.backgroundScreen)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    AccentButton(text: "hotel_to_room_button") {
                        //action
                    }
                }
            }
        }
        .overlay(alignment: .top) {
            SystemNavigationBar(title: "booking_navigation_title")
        }
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
