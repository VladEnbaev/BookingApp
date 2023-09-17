//
//  BuyerInfoViewModel.swift
//  BookingApp
//
//  Created by Влад Енбаев on 17.09.2023.
//

import Foundation

@MainActor
final class BuyerInfoViewModel: IdentifiableObject {
    @Published var phoneNumber: String = ""
    @Published var email: String = ""
    @Published private var isEmailEmptyError = false
    @Published var isPhoneNumberInvalid = false
    
    var formattedPhoneNumber: String {
        if phoneNumber == "+7 " {
            return ""
        } else {
            return phoneNumber
        }
    }
    
    var isEmailInvalid: Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return (!email.isEmpty && !emailPredicate.evaluate(with: email)) || isEmailEmptyError
    }
    
    func phoneNumberChanged(_ number: String) {
        self.phoneNumber = Formatter.format(phoneNumber: number)
        
    }
    
    func isInvalid() -> Bool {
        isEmailEmptyError = email.isEmpty
        isPhoneNumberInvalid = phoneNumber.count < 16
        return isEmailEmptyError || isPhoneNumberInvalid || isEmailInvalid
    }
}
