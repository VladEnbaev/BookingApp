//
//  BookingAppApp.swift
//  BookingApp
//
//  Created by Влад Енбаев on 12.09.2023.
//

import SwiftUI

@main
struct BookingApp: App {
    var body: some Scene {
        WindowGroup {
            //HotelScreenView(viewModel: .init(bookingService: BookingService()))
            RoomsScreenView(viewModel: RoomsScreenViewModel(bookingService: BookingService()))
        }
    }
}
