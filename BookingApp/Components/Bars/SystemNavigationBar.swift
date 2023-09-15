//
//  SystemNavigationBar.swift
//  BookingApp
//
//  Created by Влад Енбаев on 13.09.2023.
//

import SwiftUI

struct SystemNavigationBar: View {
    var title: LocalizedStringKey
    var backButtonHidden: Bool
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(
        title: LocalizedStringKey,
        backButtonHidden: Bool = false
    ) {
        self.title = title
        self.backButtonHidden = backButtonHidden
    }
    
    var body: some View {
        HStack {
            backButton
            Spacer()
        }
        .overlay {
            Text(title)
                .font(.custom(Fonts.medium, size: 18))
                .multilineTextAlignment(.center)
                .foregroundColor(.contentPrimary)
        }
        .padding(.top, 5)
        .padding(.bottom, 10)
        .padding(.horizontal, 10)
        .background(Color.backgroundSurface)
    }
    
    var backButton: some View {
        Button(action: { mode.wrappedValue.dismiss() }) {
            Image(backButtonHidden ? "" : Assets.Icons.leftArrow)
                .resizable()
                .frame(width: 32, height: 32, alignment: .center)
        }
    }
}

struct SystemNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        SystemNavigationBar(title: "hotel_navigation_title")
    }
}
