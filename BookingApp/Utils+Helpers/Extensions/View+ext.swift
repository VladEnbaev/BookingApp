//
//  View+ext.swift
//  BookingApp
//
//  Created by Влад Енбаев on 13.09.2023.
//

import SwiftUI

//Aligment

enum FrameAligment {
    case top, bottom, leading, trailing
}

extension View {
    
    @ViewBuilder
    func aligment(_ aligment: FrameAligment) -> some View {
        switch aligment {
        case .top:
            self.frame(maxHeight: .infinity, alignment: .top)
        case .bottom:
            self.frame(maxHeight: .infinity, alignment: .bottom)
        case .leading:
            self.frame(maxWidth: .infinity, alignment: .leading)
        case .trailing:
            self.frame(maxHeight: .infinity, alignment: .trailing)
        }
    }
}
