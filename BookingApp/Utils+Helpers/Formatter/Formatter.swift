//
//  Formatter.swift
//  BookingApp
//
//  Created by Влад Енбаев on 16.09.2023.
//

import Foundation

struct Formatter {
    
    private init() {}
    
    static func format(currency: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.groupingSeparator = " "
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSize = 3
        numberFormatter.locale = Locale(identifier: "ru_RU")
        numberFormatter.maximumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: currency)) ?? ""
    }
    
    static func format(phoneNumber: String) -> String {
        var initNumber = ""
        if phoneNumber.hasPrefix("+7 ") {
            initNumber = String(phoneNumber.dropFirst(3))
        }
        let number = initNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result: String = ""
        var index = number.startIndex
       
        let mask = "(XXX) XXX-XX-XX"
        
        for character in mask where index < number.endIndex {
            if character == "X" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(character)
            }
        }
       
        return "+7 " + result
    }
}
