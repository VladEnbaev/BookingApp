//
//  RoomsScreenView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 14.09.2023.
//

import SwiftUI

struct RoomsScreenView: View {
    
    @ObservedObject var viewModel: RoomsScreenViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                ForEach(viewModel.rooms, id: \.id) { room in
                    RoomCellView(
                        viewModel: viewModel.getRoomViewModel(room: room)
                    )
                }
            }
            .padding(.top, 60)
        }
        .background(Color.backgroundScreen)
        .onAppear {
            viewModel.getRooms()
        }
        .blur(radius: viewModel.isIndicatorOn ? 4 : 0)
        .overlay {
            activityIndicator
        }
        .overlay(alignment: .top) {
            SystemNavigationBar(title: "hotel_navigation_title")
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

struct RoomsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RoomsScreenView(viewModel: .init(bookingService: BookingService(),
                                         navigationSubject: .init()))
    }
}
