//
//  HotelScreenViewModel.swift
//  BookingApp
//
//  Created by Влад Енбаев on 13.09.2023.
//

import Foundation

@MainActor
final class HotelScreenViewModel: ObservableObject {
    @Published private(set) var hotelName: String = "Steigenberger Makadi"
    @Published private(set) var hotelAddress: String = "Madinat Makadi, Safaga Road, Makadi Bay, Египет"
    @Published private(set) var rating: String = "5 Super"
    @Published private(set) var price: String = "30 000"
    @Published private(set) var priceDescription: String = "за тур с перелетом"
    @Published private(set) var imageUrls: [URL] = []
    
    @Published private(set) var hotelDescription: String = "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!"
    @Published private(set) var hotelPeculiarities: [String] = ["3-я линия", "Платный Wi-Fi в фойе", "30 км до аэропорта", "1 км до пляжа", "40 км до аэропорта"]
    
    @Published private(set) var isIndicatorOn: Bool = false
    
    var bookingService: BookingServiceProtocol
    
    init(bookingService: BookingServiceProtocol) {
        self.bookingService = bookingService
    }
    
    func getHotel() {
        isIndicatorOn = true
        Task {
            do {
                let hotels = try await bookingService.getHotels()
                configureHotel(hotel: hotels[0])
                isIndicatorOn = false
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func configureHotel(hotel: Hotel) {
        configureImagesURLs(urlStrings: hotel.imageUrls)
        rating = "\(hotel.rating) \(hotel.ratingName)"
        hotelName = hotel.name
        hotelAddress = hotel.adress
        configurePrice(price: hotel.minPrice)
        priceDescription = hotel.priceDescription
        hotelPeculiarities = hotel.hotelDescription.peculiarities
        hotelDescription = hotel.hotelDescription.description
    }
    
    private func configureImagesURLs(urlStrings: [String]) {
        imageUrls = urlStrings.map({URL(string: $0)!})
    }
    
    private func configurePrice(price: Double) {
        self.price = CurrencyFormatter.format(price)
    }
}

struct CurrencyFormatter {
    
    private init() {}
    
    static var formatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.groupingSeparator = " "
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSize = 3
        numberFormatter.locale = Locale(identifier: "ru_RU")
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }()
    
    static func format(_ currency: Double) -> String {
        Self.formatter.string(from: NSNumber(value: currency)) ?? ""
    }
}
