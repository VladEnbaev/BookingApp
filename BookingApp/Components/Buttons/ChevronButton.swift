//
//  ChevronButton.swift
//  BookingApp
//
//  Created by Влад Енбаев on 15.09.2023.
//

import SwiftUI

struct ChevronButton: View {
    
    @Binding var isOpen: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(Color.accentBackground)
            .overlay {
                Image(Assets.Icons.chevronDown)
                    .resizable()
                    .frame(width: 14, height: 8, alignment: .center)
                    .foregroundColor(.primaryAccentColor)
                    .rotationEffect(.degrees(isOpen ? 180 : 0), anchor: .center)
            }
            .frame(width: 32, height: 32)
            .onTapGesture {
                withAnimation() {
                    isOpen.toggle()
                }
            }
    }
}

struct ChevronButton_Previews: PreviewProvider {
    static var previews: some View {
        ChevronButton(isOpen: .constant(true))
    }
}
