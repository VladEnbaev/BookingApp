//
//  BookingTouristViewModel.swift
//  BookingApp
//
//  Created by Влад Енбаев on 17.09.2023.
//

import SwiftUI


@MainActor
class BookingTouristViewModel: IdentifiableObject {
    
    @Published var name = ""
    @Published var surname = ""
    @Published var dateOfBirth = ""
    @Published var citizenship = ""
    @Published var passportNumber = ""
    @Published var passportExpirationDate = ""
    
    @Published var isInvalidName = false
    @Published var isInvalidSurname = false
    @Published var isInvalidDateOfBirth = false
    @Published var isInvalidCitizenship = false
    @Published var isInvalidPassportNumber = false
    @Published var isInvalidPassportExpirationDate = false
    
    @Published var title: LocalizedStringKey
    @Published var isOpen: Bool
    
    init(number: Numbers, isOpen: Bool = false){
        self.title = number.localized
        self.isOpen = isOpen
    }
    
    func isInvalid() -> Bool {
        
        isInvalidName = name.isEmpty
        isInvalidSurname = surname.isEmpty
        isInvalidDateOfBirth = dateOfBirth.isEmpty
        isInvalidCitizenship = citizenship.isEmpty
        isInvalidPassportNumber = passportNumber.isEmpty
        isInvalidPassportExpirationDate = passportExpirationDate.isEmpty
        
        return isInvalidName || isInvalidSurname || isInvalidDateOfBirth || isInvalidCitizenship || isInvalidPassportNumber || isInvalidPassportExpirationDate
    }
}
