//
//  BookingScreenViewModel.swift
//  BookingApp
//
//  Created by Влад Енбаев on 15.09.2023.
//

import SwiftUI
import Combine

enum Numbers: Int, CaseIterable {
    case first = 1
    case second
    case third
    case fourth
    case fifth
    
    var localized: LocalizedStringKey {
        switch self {
        case .first:
            return "first"
        case .second:
            return "second"
        case .third:
            return "third"
        case .fourth:
            return "fourth"
        case .fifth:
            return "fifth"
        }
    }
}

@MainActor
final class BookingScreenViewModel: IdentifiableObject {
    
    @Published private(set) var hotelName: String = ""
    @Published private(set) var hotelAddress: String = ""
    @Published private(set) var rating: String = ""
    @Published private(set) var departure: String = "Санкт-Петербург"
    @Published private(set) var arrivalCountry: String = "Египет, Хургада"
    @Published private(set) var tourDates: String = ""
    @Published private(set) var numberOfNights: String = ""
    @Published private(set) var room: String = "Люкс номер с видом на море"
    @Published private(set) var nutrition: String = ""

    @Published private(set) var tourPrice: String = ""
    @Published private(set) var fuelCharge: String = ""
    @Published private(set) var serviceCharge: String = ""
    @Published private(set) var totalPrice: String = ""
    
    @Published var alertPresented = false
    @Published private(set) var isIndicatorOn = false
    
    @Published private(set) var touristViewModels = [
        BookingTouristViewModel(number: .first, isOpen: true)
    ]
    
    @Published private(set) var buyerInfoViewModel = BuyerInfoViewModel()
    
    var bookingService: BookingServiceProtocol
    var navigationSubject: PassthroughSubject<AppCoordinator.FlowType, Never>
    
    init(
        bookingService: BookingServiceProtocol,
        navigationSubject: PassthroughSubject<AppCoordinator.FlowType, Never>
    ) {
        self.bookingService = bookingService
        self.navigationSubject = navigationSubject
    }
    
    func getBookingInfo() {
        isIndicatorOn = true
        Task {
            do {
                let bookingInfo = try await bookingService.getBookingInfo()
                configure(with: bookingInfo)
                isIndicatorOn = false
            } catch {
                print(error)
            }
        }
    }
    
    func payButtonTapped() {
        if isTextFieldsInvalid() {
            alertPresented = true
        } else {
            navigationSubject.send(.toPaidScreen)
        }
    }
    
    func addTouristButtonTapped() {
        if touristViewModels.count < Numbers.allCases.count {
            let number = Numbers(rawValue: touristViewModels.count + 1)!
            touristViewModels.append(BookingTouristViewModel(number: number))
        }
    }
    
    private func isTextFieldsInvalid() -> Bool {
        
        let isInvalidTourists = touristViewModels.map({ $0.isInvalid() }).contains(true)
        
        let isInvalidBuyer =  buyerInfoViewModel.isInvalid()
        
        return isInvalidTourists || isInvalidBuyer
    }
    
    private func configure(with bookingInfo: BookingInfo) {
        hotelName = bookingInfo.hotelName
        hotelAddress = bookingInfo.hotelAdress
        rating = "\(bookingInfo.horating) \(bookingInfo.ratingName)"
        departure = bookingInfo.departure
        arrivalCountry = bookingInfo.arrivalCountry
        numberOfNights = String(bookingInfo.numberOfNights)
        room = bookingInfo.room
        nutrition = bookingInfo.nutrition
        fuelCharge = String(bookingInfo.fuelCharge)
        serviceCharge = String(bookingInfo.serviceCharge)
        
        configurePrices(bookingInfo: bookingInfo)
        configureTourDates(start: bookingInfo.tourDateStart, end: bookingInfo.tourDateStop)
    }
    
    private func configureTourDates(start: String, end: String) {
        tourDates = "\(start) - \(end)"
    }
    
    private func configurePrices(bookingInfo: BookingInfo) {
        let totalPrice = bookingInfo.fuelCharge + bookingInfo.serviceCharge + bookingInfo.tourPrice
        
        self.totalPrice = Formatter.format(currency: totalPrice)
        self.fuelCharge = Formatter.format(currency: bookingInfo.fuelCharge)
        self.serviceCharge = Formatter.format(currency: bookingInfo.serviceCharge)
        self.tourPrice = Formatter.format(currency: bookingInfo.tourPrice)
    }
}
