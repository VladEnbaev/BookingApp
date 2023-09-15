//
//  RoomsScreenViewModel.swift
//  BookingApp
//
//  Created by Влад Енбаев on 14.09.2023.
//

import Foundation
import Combine


@MainActor
final class RoomsScreenViewModel: IdentifiableObject {
    @Published private(set) var rooms = [Room]()
    
    var bookingService: BookingServiceProtocol
    var navigationSubject: PassthroughSubject<AppCoordinator.FlowType, Never>
    
    init(
        bookingService: BookingServiceProtocol,
        navigationSubject: PassthroughSubject<AppCoordinator.FlowType, Never>
    ) {
        self.bookingService = bookingService
        self.navigationSubject = navigationSubject
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
        //navigationSubject.send(.)
    }
}
