//
//  PaidScreenViewModel.swift
//  BookingApp
//
//  Created by Влад Енбаев on 16.09.2023.
//

import Foundation
import Combine

@MainActor
class PaidScreenViewModel: IdentifiableObject {
    
    @Published private(set) var orderId: Int = (100000...1000000).randomElement()!
    
    var navigationSubject: PassthroughSubject<AppCoordinator.FlowType, Never>
    
    init(
        navigationSubject: PassthroughSubject<AppCoordinator.FlowType, Never>
    ) {
        self.navigationSubject = navigationSubject
    }
    
    func superButtonTapped() {
        navigationSubject.send(.popToRoot)
    }
}
