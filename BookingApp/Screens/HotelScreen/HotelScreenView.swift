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
        ScrollView {
            HotelMainInfoView(viewModel: viewModel)
                .overlay {
                    activityIndicator
                }
            AboutHotelView(viewModel: viewModel)
        }
        .background(Color.backgroundScreen)
        .onAppear {
            viewModel.getHotel()
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
        HotelScreenView(viewModel: .init(bookingService: BookingService()))
    }
}
