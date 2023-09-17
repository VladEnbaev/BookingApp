//
//  HotelScreenView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 12.09.2023.
//

import SwiftUI

struct HotelScreenView: View {
    
    @StateObject var viewModel: HotelScreenViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 8) {
                HotelMainInfoView(viewModel: viewModel)
                AboutHotelView(viewModel: viewModel)
            }
            .padding(.top, 57)
        }
        .navigationBarHidden(true)
        .background(Color.backgroundScreen)
        .onAppear {
            viewModel.getHotel()
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                AccentButton(text: "hotel_to_room_button") {
                    viewModel.toRoomButtonPressed()
                }
                .blur(radius: viewModel.isIndicatorOn ? 4 : 0)
            }
        }
        .blur(radius: viewModel.isIndicatorOn ? 4 : 0)
        .overlay {
            activityIndicator
        }
        .overlay(alignment: .top) {
            SystemNavigationBar(title: "hotel_navigation_title", backButtonHidden: true)
        }
    }
    
    @ViewBuilder
    var activityIndicator: some View {
        if viewModel.isIndicatorOn {
            ProgressView()
                .progressViewStyle(.circular)
        }
    }
}



struct HotelScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HotelScreenView(viewModel: .init(bookingService: BookingService(), navigationSubject: .init()))
        }
    }
}
