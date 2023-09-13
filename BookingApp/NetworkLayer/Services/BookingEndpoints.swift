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

    var url: String {scheme + "://" + host + path}
    var scheme: String {API.scheme}
    var host: String {API.URL}

    var path: String {
        switch self {
        case .hotel:
            return "/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
        case .rooms:
            return "f9a38183-6f95-43aa-853a-9c83cbb05ecd"
        }
    }
    
    var method: String {
        switch self {
        case .hotel, .rooms:
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
