//
//  Room.swift
//  BookingApp
//
//  Created by Влад Енбаев on 13.09.2023.
//

import Foundation


struct Room: Decodable {
    
    let id: Int
    let name: String
    let price: Double
    let priceDescription: String
    let peculiarities: [String]
    let imageUrls: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case price = "price"
        case priceDescription = "price_per"
        case peculiarities = "peculiarities"
        case imageUrls = "image_urls"
    }
}
