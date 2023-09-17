//
//  RoomCellViewModel.swift
//  BookingApp
//
//  Created by Влад Енбаев on 14.09.2023.
//

import Foundation

protocol RoomCellParentViewModel {
    func chooseButtonTapped()
}

@MainActor
final class RoomCellViewModel: ObservableObject {
    @Published private(set) var name: String = ""
    @Published private(set) var price: String = ""
    @Published private(set) var priceDescription: String = ""
    @Published private(set) var peculiarities: [String] = []
    @Published private(set) var imageUrls: [String] = []
    
    private var room: Room
    
    var parentViewModel: RoomCellParentViewModel
    
    init(room: Room, parentViewModel: RoomCellParentViewModel) {
        self.room = room
        self.parentViewModel = parentViewModel
    }
    
    func chooseButtonTapped() {
        parentViewModel.chooseButtonTapped()
    }
    
    func configureRoom() {
        self.imageUrls = room.imageUrls
        self.name = room.name
        self.priceDescription = room.priceDescription
        self.peculiarities = room.peculiarities
        configurePrice(price: room.price)
    }
    
    private func configurePrice(price: Double) {
        self.price = Formatter.format(currency: price)
    }
}
