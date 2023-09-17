//
//  Coordinator.swift
//  BookingApp
//
//  Created by Влад Енбаев on 14.09.2023.
//

import SwiftUI
import Combine

typealias IdentifiableObject = ObservableObject & Identifiable

@MainActor
final class AppCoordinator: IdentifiableObject {
    
    // MARK: - Inputs
    let didTapApplyFilterButton = PassthroughSubject<Void, Never>()
    private let navigationSubject = PassthroughSubject<FlowType, Never>()
    
    // MARK: - Outputs
    @Published var hotelScreenViewModel: HotelScreenViewModel?
    @Published var roomsScreenViewModel: RoomsScreenViewModel?
    @Published var bookingScreenViewModel: BookingScreenViewModel?
    @Published var paidScreenViewModel: PaidScreenViewModel?
    
    // MARK: - Properties
    private var cancellables: Set<AnyCancellable> = []
    private var bookingService = BookingService()
    
    // MARK: Init/Deinit
    init() {
        hotelScreenViewModel = HotelScreenViewModel(
            bookingService: bookingService,
            navigationSubject: navigationSubject
        )
        bindPublishers()
    }
    
    private func bindPublishers() {
        navigationSubject
            .sink { [weak self] type in
                switch type {
                case .popToRoot:
                    self?.popToRoot()
                case .toRoomsScreen:
                    self?.toRoomsScreen()
                case .toBookingScreen:
                    self?.toBookingScreen()
                case .toPaidScreen:
                    self?.toPaidScreen()
                }
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Routing
    private func toRoomsScreen() {
        roomsScreenViewModel = RoomsScreenViewModel(bookingService: bookingService,
                                                    navigationSubject: navigationSubject)
    }
    
    private func toBookingScreen() {
        bookingScreenViewModel = BookingScreenViewModel(bookingService: bookingService,
                                                        navigationSubject: navigationSubject)
    }
    
    private func toPaidScreen() {
        paidScreenViewModel = PaidScreenViewModel(navigationSubject: navigationSubject)
    }
    
    private func popToRoot() {
        roomsScreenViewModel = nil
        bookingScreenViewModel = nil
        paidScreenViewModel = nil
    }
    
}

// MARK: Coordinator cases
extension AppCoordinator {
    enum FlowType {
        case popToRoot
        case toRoomsScreen
        case toBookingScreen
        case toPaidScreen
    }
}

public enum NavigationMode {
    case push(onPop: () -> Void = {})
    case modalPresent(onDismiss: (() -> Void)? = nil)
    case fullScreenPresent(onDismiss: (() -> Void)? = nil)
}

// MARK: - View Extension
public extension View {
    
    // MARK: - Private methods
    @ViewBuilder
    private func navigationLink<Destination: View>(
        isActive: Binding<Bool>,
        @ViewBuilder destination: @escaping () -> Destination
    ) -> some View {
        NavigationLink(
            destination: isActive.wrappedValue ? destination() : nil,
            isActive: isActive,
            label: { EmptyView() }
        )
    }
    
    // MARK: - Public methods
    func onNavigation(_ action: @escaping () -> Void) -> some View {
        let isActive = Binding(
            get: { false },
            set: { newValue in
                if newValue {
                    action()
                }
            }
        )
        return NavigationLink(destination: EmptyView(), isActive: isActive) {
            self
        }
    }
    
    @ViewBuilder
    func navigation<Model: Identifiable, Destination: View> (
        model: Binding<Model?>,
        mode: NavigationMode = .push(),
        @ViewBuilder destination: @escaping (Model) -> Destination
    ) -> some View {
        switch mode {
        case .push(let onPop):
            let isActive = Binding(
                get: { model.wrappedValue != nil },
                set: { newValue in
                    guard model.wrappedValue != nil, !newValue else {
                        return
                    }
                    onPop()
                    model.wrappedValue = nil
                }
            )
            overlay(
                navigationLink(isActive: isActive) {
                    model.wrappedValue.map(destination)
                }
            )
        case .modalPresent(let onDismiss):
            sheet(
                item: model,
                onDismiss: onDismiss,
                content: destination
            )
        case .fullScreenPresent(let onDismiss):
            fullScreenCover(
                item: model,
                onDismiss: onDismiss,
                content: destination
            )
        }
    }
    
}
