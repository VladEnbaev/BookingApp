//
//  AboutHotelView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 13.09.2023.
//

import SwiftUI

struct AboutHotelView: View {
    
    @ObservedObject var viewModel: HotelScreenViewModel
    
    var body: some View {
        VStack(spacing: 21) {
            title
            PeculiaritiesView(peculiarities: viewModel.hotelPeculiarities)
            description
            HotelInfoCategoriesView()
        }
        .edgesIgnoringSafeArea(.top)
        .padding(16)
        .background(Color.backgroundSurface)
        .cornerRadius(12)
    }
    
    var title: some View {
        Text("hotel_about_label")
            .font(.custom(Fonts.medium, size: 22))
            .foregroundColor(.contentPrimary)
            .aligment(.leading)
    }
    
    var description: some View {
        Text(viewModel.hotelDescription)
            .font(.custom("SF Pro Display", size: 16))
            .foregroundColor(.contentPrimary.opacity(0.9))
            .multilineTextAlignment(.leading)
            .aligment(.leading)
    }
}

struct AboutHotelView_Previews: PreviewProvider {
    static var previews: some View {
        AboutHotelView(viewModel: .init(bookingService: BookingService()))
    }
}
