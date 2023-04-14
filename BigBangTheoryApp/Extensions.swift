//
//  Extensions.swift
//  BigBangTheoryApp
//
//  Created by Monica Galan de la Llana on 9/4/23.
//

import UIKit

extension String {
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self)
    }
    
    func convertToMonthYearString() -> String? {
        guard let date = self.convertToDate() else { return nil }
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "MMMM yyyy"
        return outputDateFormatter.string(from: date)
    }
}

extension Notification.Name {
    static let favoritesChange = Notification.Name("FAVCHANGES")
}
