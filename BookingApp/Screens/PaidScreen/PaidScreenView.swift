//
//  PaidScreenView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 16.09.2023.
//

import SwiftUI

struct PaidScreenView: View {
    
    @ObservedObject var viewModel: PaidScreenViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 32) {
                imageView
                VStack(alignment: .center, spacing: 20) {
                    firstTitle
                    description
                }
            }
            .padding(16)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    AccentButton(text: "paid_super_button") {
                        viewModel.superButtonTapped()
                    }
                }
            }
        }
        .overlay(alignment: .top) {
            SystemNavigationBar(title: "paid_navigation_title")
        }
    }
    
    var imageView: some View {
        Image(Assets.Images.partyPopper)
            .resizable()
            .frame(width: 44, height: 44)
            .padding(25)
            .background(Color(red: 0.96, green: 0.96, blue: 0.98))
            .cornerRadius(1000)
    }
    
    var firstTitle: some View {
        Text("paid_title")
            .font(.custom(Fonts.medium, size: 28))
            .multilineTextAlignment(.center)
    }
    
    var description: some View {
        Text("paid_description_label \(String(viewModel.orderId))")
            .font(.custom(Fonts.regular, size: 16))
            .foregroundColor(.contentSecondary)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 7)

    }
}

struct PaidScreenView_Previews: PreviewProvider {
    static var previews: some View {
        PaidScreenView(viewModel: .init(navigationSubject: .init()))
    }
}
