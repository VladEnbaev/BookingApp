//
//  BookingInfo.swift
//  BookingApp
//
//  Created by Влад Енбаев on 15.09.2023.
//

import Foundation

struct BookingInfo: Decodable {
    
    let id: Int
    let hotelName, hotelAdress: String
    let horating: Int
    let ratingName: String
    let departure: String
    let arrivalCountry: String
    let tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room, nutrition: String
    let tourPrice, fuelCharge, serviceCharge: Double

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case hotelName = "hotel_name"
        case hotelAdress = "hotel_adress"
        case horating = "horating"
        case ratingName = "rating_name"
        case departure = "departure"
        case arrivalCountry = "arrival_country"
        case tourDateStart = "tour_date_start"
        case tourDateStop = "tour_date_stop"
        case numberOfNights = "number_of_nights"
        case room = "room"
        case nutrition = "nutrition"
        case tourPrice = "tour_price"
        case fuelCharge = "fuel_charge"
        case serviceCharge = "service_charge"
    }
}


