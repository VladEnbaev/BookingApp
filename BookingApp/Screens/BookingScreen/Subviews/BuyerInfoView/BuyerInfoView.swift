//
//  BuyerInfoView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 15.09.2023.
//

import SwiftUI
import Combine

struct BuyerInfoView: View {
    
    @ObservedObject var viewModel: BuyerInfoViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            title
            VStack(alignment: .leading, spacing: 8) {
                SystemTextField(
                    title: "booking_phone_number",
                    text: Binding(get: {
                        viewModel.phoneNumber
                    }, set: { value in
                        viewModel.phoneNumberChanged(value)
                    }),
                    isInvalid: viewModel.isPhoneNumberInvalid
                )
                .keyboardType(.numberPad)
                SystemTextField(
                    title: "booking_email",
                    text: $viewModel.email,
                    isInvalid: viewModel.isEmailInvalid
                )
                .autocorrectionDisabled(true)
                    
                termsOfUse
            }
        }
        .padding(16)
        .background(Color.backgroundSurface)
        .cornerRadius(12)
    }
    
    var title: some View {
        Text("booking_buyer_info_title")
            .font(.custom(Fonts.medium, size: 22))
            .foregroundColor(.contentPrimary)
    }
    
    var termsOfUse: some View {
        Text("booking_terms_of_use")
            .font(.custom(Fonts.regular, size: 14))
            .foregroundColor(.contentSecondary)
    }
    
    private func format(_ phoneNumber: String) -> String {
        Formatter.format(phoneNumber: phoneNumber)
    }
    
    private func validateEmail() {
        
    }
}

struct BuyerInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BuyerInfoView(viewModel: .init())
    }
}
