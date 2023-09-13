//
//  Hotel.swift
//  BookingApp
//
//  Created by Влад Енбаев on 13.09.2023.
//

import Foundation



struct Hotel: Decodable  {
    
    let id: Int
    let name: String
    let adress: String
    let minPrice: Double
    let priceDescription: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let hotelDescription: HotelDescription
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case adress = "adress"
        case minPrice = "minimal_price"
        case priceDescription = "price_for_it"
        case rating = "rating"
        case ratingName = "rating_name"
        case imageUrls = "image_urls"
        case hotelDescription = "about_the_hotel"
    }
}

extension Hotel {
    struct HotelDescription: Decodable {
        let description: String
        let peculiarities: [String]
    }
}
