//
//  UIColorExtensions.swift
//  HW17
//
//  Created by Роман Литвинович on 7.09.23.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hexString: String) {
        var cleanString = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cleanString.hasPrefix("#") {
            cleanString.remove(at: cleanString.startIndex)
        }

        if cleanString.count != 6 {
            self.init(white: 1.0, alpha: 1.0)
            return
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cleanString).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
