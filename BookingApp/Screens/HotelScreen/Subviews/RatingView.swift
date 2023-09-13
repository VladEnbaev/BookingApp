//
//  RatingView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 12.09.2023.
//

import SwiftUI

struct RatingView: View {
    
    var rate: String
    
    var body: some View {
        HStack(spacing: 2) {
            Image(Assets.Icons.star)
                .resizable()
                .frame(width: 15, height: 15)
            Text(rate)
                .foregroundColor(.ratingForeground)
                .font(.custom(Fonts.medium, size: 16))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color.ratingBackground)
        .cornerRadius(5)
    }
}

struct RatingView_Previews: PreviewProvider {
    
    static var previews: some View {
        RatingView(rate: "5 Отлично")
    }
}
