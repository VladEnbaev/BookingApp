//
//  AppCoordinatorView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 14.09.2023.
//

import SwiftUI

struct AppCoordinatorView: View {
    @StateObject var coordinator = AppCoordinator()
    
    var body: some View {
        NavigationView {
            HotelScreenView(viewModel: coordinator.hotelScreenViewModel!)
                .navigation(model: $coordinator.roomsScreenViewModel) { viewModel in
                    RoomsScreenView(viewModel: viewModel).navigationBarHidden(true)
                        .navigation(model: $coordinator.bookingScreenViewModel) { viewModel in
                            BookingScreenView(viewModel: viewModel).navigationBarHidden(true)
                                .navigation(model: $coordinator.paidScreenViewModel) { viewModel in
                                    PaidScreenView(viewModel: viewModel).navigationBarHidden(true)
                                }
                        }
                }
        }
        .navigationViewStyle(.stack)
    }
}

struct AppCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        AppCoordinatorView()
    }
}

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
