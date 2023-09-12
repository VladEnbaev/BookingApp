//
//  Fonts.swift
//  BookingApp
//
//  Created by Влад Енбаев on 12.09.2023.
//

import SwiftUI


enum Fonts {
    static let regular : String = "SFProDisplay-Regular"
    static let medium : String = "SFProDisplay-Medium"
    static let semibold : String = "SFProDisplay-Semibold"
    
    static func printAllFonts() {
        for familyName in UIFont.familyNames {
            print("\n-- \(familyName) \n")
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print(fontName)
            }
        }
    }
}
