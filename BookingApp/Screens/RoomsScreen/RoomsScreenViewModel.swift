//
//  RoomsScreenViewModel.swift
//  BookingApp
//
//  Created by Влад Енбаев on 14.09.2023.
//

import Foundation


@MainActor
final class RoomsScreenViewModel: ObservableObject {
    @Published private(set) var rooms = [Room]()
    
    var bookingService: BookingServiceProtocol
    
    init(bookingService: BookingServiceProtocol) {
        self.bookingService = bookingService
    }
    
    func getRooms() {
        Task {
            do {
                rooms = try await bookingService.getRooms()
            } catch {
                print(error)
            }
        }
    }
    
    func getRoomViewModel(room: Room) -> RoomCellViewModel {
        RoomCellViewModel(room: room, parentViewModel: self)
    }
}

extension RoomsScreenViewModel: RoomCellParentViewModel {
    func chooseButtonTapped() {
        print("GO GO GO")
    }
}
