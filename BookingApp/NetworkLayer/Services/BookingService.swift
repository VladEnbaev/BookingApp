//
//  BookingService.swift
//  BookingApp
//
//  Created by Влад Енбаев on 13.09.2023.
//

import Foundation


import Foundation

protocol BookingServiceProtocol {
    func getHotels() async throws -> Hotel
    func getRooms() async throws -> [Room]
}

final class BookingService: BookingServiceProtocol {
    
    var networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func getHotels() async throws -> Hotel {
        return try await networkService.sendRequest(endpoint: .hotel, responseModel: Hotel.self)
    }
    
    func getRooms() async throws -> [Room] {
        let response = try await networkService.sendRequest(endpoint: .rooms, responseModel: RoomsResponse.self)
        return response.rooms
    }
}
