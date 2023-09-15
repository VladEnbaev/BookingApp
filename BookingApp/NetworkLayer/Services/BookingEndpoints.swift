//
//  Endpoint.swift
//  BookingApp
//
//  Created by Влад Енбаев on 13.09.2023.
//

import Foundation


import Foundation


enum BookingEdpoints: Equatable {
    case hotel
    case rooms
    case bookingInfo

    var url: String {scheme + "://" + host + path}
    var scheme: String {API.scheme}
    var host: String {API.URL}

    var path: String {
        switch self {
        case .hotel:
            return "/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
        case .rooms:
            return "/f9a38183-6f95-43aa-853a-9c83cbb05ecd"
        case .bookingInfo:
            return "/e8868481-743f-4eb2-a0d7-2bc4012275c8"
        }
    }
    
    var method: String {
        switch self {
        case .hotel, .rooms, .bookingInfo:
            return "GET"
        }
    }

}

struct API {
    static var schemeURL: String {scheme + "://" + URL}
    static var scheme: String {return "https"}
    static var URL: String {
        "run.mocky.io/v3"
    }
}

//https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd
