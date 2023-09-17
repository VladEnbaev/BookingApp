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
                    buyerInfoView
                    touristViews
                    AddTouristView(action: { viewModel.addTouristButtonTapped() })
                    PriceView(viewModel: viewModel)
                }
                .padding(.top, 55)
                .padding(.bottom, 8)
            }
            .background(Color.backgroundScreen)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    AccentButton(text: "booking_pay_button \(viewModel.totalPrice)") {
                        viewModel.payButtonTapped()
                    }
                }
            }
        }
        .onAppear {
            viewModel.getBookingInfo()
        }
        .alert("Заполните все поля", isPresented: $viewModel.alertPresented) {
            Button("OK") {
                viewModel.alertPresented = true
            }
        }
        .blur(radius: viewModel.isIndicatorOn ? 4 : 0)
        .overlay {
            activityIndicator
        }
        .overlay(alignment: .top) {
            SystemNavigationBar(title: "booking_navigation_title")
        }
    }
    
    var touristViews: some View {
        ForEach(viewModel.touristViewModels) { vm in
            BookingTouristView(viewModel: vm)
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
        BuyerInfoView(viewModel: viewModel.buyerInfoViewModel)
    }
    
    @ViewBuilder
    var activityIndicator: some View {
        if viewModel.isIndicatorOn {
            ProgressView()
                .progressViewStyle(.circular)
        }
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
