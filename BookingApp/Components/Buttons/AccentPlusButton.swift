//
//  AccentPlusButton.swift
//  BookingApp
//
//  Created by Влад Енбаев on 15.09.2023.
//

import SwiftUI

struct AccentPlusButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            label
        }
    }
    
    var label: some View {
        Image(systemName: "plus")
            .frame(width: 24, height: 24)
            .font(.headline)
            .foregroundColor(.white)
            .padding(2)
            .background(.blue)
            .cornerRadius(6)
    }
}

struct AccentPlusButton_Previews: PreviewProvider {
    static var previews: some View {
        AccentPlusButton(action: {})
    }
}
