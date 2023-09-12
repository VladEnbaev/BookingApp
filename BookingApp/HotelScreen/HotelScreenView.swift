//
//  HotelScreenView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 12.09.2023.
//

import SwiftUI

struct HotelScreenView: View {
    var body: some View {
        VStack {
            adressButton
            hotelNameLabel
        }
    }
    
    var adressButton: some View {
        Button {
            //
        } label: {
            Text("Some")
                .font(.custom(Fonts.semibold, size: 14))
                .foregroundColor(.accentColor)
        }
    }
    
    var hotelNameLabel: some View {
        HStack {
            Text("some")
                .font(.custom(Fonts.regular, size: 22))
            Spacer()
        }
    }
}


struct HotelScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HotelScreenView()
    }
}
