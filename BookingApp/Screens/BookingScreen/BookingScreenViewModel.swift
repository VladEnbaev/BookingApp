//
//  BookingScreenViewModel.swift
//  BookingApp
//
//  Created by Влад Енбаев on 15.09.2023.
//

import Foundation
import Combine

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
        Task {
            do {
                let bookingInfo = try await bookingService.getBookingInfo()
                configure(with: bookingInfo)
            } catch {
                print(error)
            }
        }
    }
    
    private func configure(with bookingInfo: BookingInfo) {
        hotelName = bookingInfo.hotelName
        hotelAddress = bookingInfo.hotelAdress
        rating = bookingInfo.ratingName
        departure = bookingInfo.departure
        arrivalCountry = bookingInfo.arrivalCountry
        numberOfNights = String(bookingInfo.numberOfNights)
        room = bookingInfo.room
        nutrition = bookingInfo.nutrition
        fuelCharge = String(bookingInfo.fuelCharge)
        serviceCharge = String(bookingInfo.serviceCharge)
        
        configurePrice(price: bookingInfo.tourPrice)
        configureTourDates(start: bookingInfo.tourDateStart, end: bookingInfo.tourDateStop)
    }
    
    private func configureTourDates(start: String, end: String) {
        tourDates = "\(start) - \(end)"
    }
    
    private func configurePrice(price: Double) {
        tourPrice = CurrencyFormatter.format(price)
    }
}
