//
//  HotelScreenView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 12.09.2023.
//

import SwiftUI

struct HotelScreenView: View {
    var body: some View {
        ScrollView {
            HotelInfoView()
        }
        .background(Color.backgroundScreen)
    }
}

struct HotelInfoView: View {
    var body: some View {
        VStack(spacing: 16) {
            ImageCarouselView(urls: previewImageURls)
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
            RatingView(rate: "5 Превосходно")
            hotelNameLabel
            locationButton
        }
        .aligment(.leading)
    }
    
    var hotelNameLabel: some View {
        Text("Steigenberger Makadi")
            .font(.custom(Fonts.medium, size: 22))
    }
    
    var locationButton: some View {
        Button(action: { }) {
            Text("Madinat Makadi, Safaga Road, Makadi Bay, Египет")
                .font(.custom(Fonts.medium, size: 14))
        }
    }
    
    var hotelPriceView: some View {
        HStack(spacing: 8) {
            Text("9999")
                .font(.custom(Fonts.semibold, size: 30))
            VStack {
                Spacer()
                Text("for tour")
                    .font(.custom(Fonts.regular, size: 16))
                    .foregroundColor(.contentSecondary)
            }
            Spacer()
        }.frame(height: 28)
    }
}

struct HotelScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HotelScreenView()
    }
}
