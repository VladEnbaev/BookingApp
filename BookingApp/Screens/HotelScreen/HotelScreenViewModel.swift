//
//  HotelScreenViewModel.swift
//  BookingApp
//
//  Created by Влад Енбаев on 13.09.2023.
//

import Foundation
import Combine

@MainActor
final class HotelScreenViewModel: IdentifiableObject {
    @Published private(set) var hotelName: String = "" //"Steigenberger Makadi"
    @Published private(set) var hotelAddress: String = "" //"Madinat Makadi, Safaga Road, Makadi Bay, Египет"
    @Published private(set) var rating: String = "" //"5 Super"
    @Published private(set) var price: String = "" //"30 000"
    @Published private(set) var priceDescription: String = "" //"за тур с перелетом"
    @Published private(set) var imageUrls: [String] = []
    
    @Published private(set) var hotelDescription: String = "" //"Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!"
    @Published private(set) var hotelPeculiarities: [String] = [] //["3-я линия", "Платный Wi-Fi в фойе", "30 км до аэропорта", "1 км до пляжа", "40 км до аэропорта"]
    
    @Published private(set) var isIndicatorOn: Bool = false
    
    var bookingService: BookingServiceProtocol
    var navigationSubject: PassthroughSubject<AppCoordinator.FlowType, Never>
    
    init(
        bookingService: BookingServiceProtocol,
        navigationSubject: PassthroughSubject<AppCoordinator.FlowType, Never>
    ) {
        self.bookingService = bookingService
        self.navigationSubject = navigationSubject
    }
    
    func getHotel() {
        isIndicatorOn = true
        Task {
            do {
                let hotel = try await bookingService.getHotels()
                configureHotel(hotel: hotel)
                isIndicatorOn = false
            } catch {
                print(error)
            }
        }
    }
    
    private func configureHotel(hotel: Hotel) {
        imageUrls = hotel.imageUrls
        rating = "\(hotel.rating) \(hotel.ratingName)"
        hotelName = hotel.name
        hotelAddress = hotel.adress
        configurePrice(price: hotel.minPrice)
        priceDescription = hotel.priceDescription
        hotelPeculiarities = hotel.hotelDescription.peculiarities
        hotelDescription = hotel.hotelDescription.description
    }
    
    private func configurePrice(price: Double) {
        self.price = Formatter.format(currency: price)
    }
    
    func toRoomButtonPressed() {
        navigationSubject.send(.toRoomsScreen)
    }
}
