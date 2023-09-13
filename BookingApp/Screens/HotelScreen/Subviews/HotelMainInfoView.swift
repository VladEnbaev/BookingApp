//
//  HotelMainInfoView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 13.09.2023.
//

import SwiftUI

struct HotelMainInfoView: View {
    
    @ObservedObject var viewModel: HotelScreenViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            ImageCarouselView(urls: viewModel.imageUrls)
            hotelMainInfoView
            hotelPriceView
        }
        .edgesIgnoringSafeArea(.top)
        .padding(16)
        .background(Color.backgroundSurface)
        .cornerRadius(12)
    }
    
    var hotelMainInfoView: some View {
        VStack(alignment: .leading, spacing: 8) {
            RatingView(rate: viewModel.rating)
            hotelNameLabel
            locationButton
        }
        .aligment(.leading)
    }
    
    var hotelNameLabel: some View {
        Text(viewModel.hotelName)
            .font(.custom(Fonts.medium, size: 22))
    }
    
    var locationButton: some View {
        Button(action: { }) {
            Text(viewModel.hotelAddress)
                .font(.custom(Fonts.medium, size: 14))
        }
    }
    
    var hotelPriceView: some View {
        HStack(spacing: 8) {
            Group {
                Text("hotel_price_from") + Text(viewModel.price)
            }
            .font(.custom(Fonts.semibold, size: 30))
            VStack {
                Spacer()
                Text(viewModel.priceDescription)
                    .font(.custom(Fonts.regular, size: 16))
                    .foregroundColor(.contentSecondary)
            }
            Spacer()
        }.frame(height: 28)
    }
}

struct HotelMainInfoView_Previews: PreviewProvider {
    static var previews: some View {
        HotelMainInfoView(viewModel: .init(bookingService: BookingService()))
    }
}
