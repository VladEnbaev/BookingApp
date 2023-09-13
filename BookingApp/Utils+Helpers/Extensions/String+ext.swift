//
//  String+ext.swift
//  BookingApp
//
//  Created by Влад Енбаев on 13.09.2023.
//

import Foundation


extension String {
    func localized() -> String {
        NSLocalizedString(self, bundle: .main, comment: "")
    }
}
