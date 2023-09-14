//
//  RoomCellView.swift
//  BookingApp
//
//  Created by Влад Енбаев on 14.09.2023.
//

import SwiftUI

struct RoomCellView: View {
    
    @ObservedObject var viewModel: RoomCellViewModel
    
    var body: some View {
        VStack(spacing: 8){
            ImageCarouselView(urls: viewModel.imageUrls)
            title
            PeculiaritiesView(peculiarities: viewModel.peculiarities)
            detailButton
            priceLabel
            chooseButton
                .padding(.top, 8)
        }
        .padding(16)
        .background(Color.backgroundSurface)
        .cornerRadius(12)
        .onAppear {
            viewModel.configureRoom()
        }
    }
    
    var chooseButton: some View {
        AccentButton(text: "rooms_choose_room_button") {
            viewModel.chooseButtonTapped()
        }
    }
    
    var title: some View {
        HStack{
            Text(viewModel.name)
                .font(.custom(Fonts.medium, size: 22))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .frame(maxWidth: .infinity)
    }
    
    var detailButton: some View {
        DetailButton(text: "rooms_detail_button", action: { })
            .aligment(.leading)
    }
    
    var priceLabel: some View {
        HStack(alignment: .bottom, spacing: 8){
            Text(viewModel.price)
                .font(.custom(Fonts.semibold, size: 30))
                .foregroundColor(.contentPrimary)
            Text(viewModel.priceDescription )
                .font(Font.custom(Fonts.regular, size: 16))
                .foregroundColor(.contentSecondary)
                .padding(.bottom, 4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct RoomCellView_Previews: PreviewProvider {
    static var previews: some View {
        RoomCellView(
            viewModel: .init(room: Room.testRoom,
                             parentViewModel:
                                RoomsScreenViewModel(bookingService: BookingService())))
    }
}
