//
//  NetworkService.swift
//  BookingApp
//
//  Created by Влад Енбаев on 13.09.2023.
//

import Foundation


enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorised
    case offline
    case unknown

    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorised:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}

protocol NetworkServiceProtocol {
    func sendRequest<T: Decodable>(endpoint: BookingEdpoints, responseModel: T.Type) async throws -> T
}


class NetworkService: NetworkServiceProtocol {
    func sendRequest<T: Decodable>(
        endpoint: BookingEdpoints,
        responseModel: T.Type
    ) async throws -> T {

        let request = URLComponents(string: endpoint.url)!

        guard let url = request.url else { throw RequestError.invalidURL }

        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = endpoint.method

        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                throw RequestError.noResponse
            }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    throw RequestError.decode
                }
                return decodedResponse
            case 401:
                throw RequestError.unauthorised
            default:
                throw RequestError.unknown
            }
        } catch URLError.Code.notConnectedToInternet {
            throw RequestError.offline
        }
    }
}
