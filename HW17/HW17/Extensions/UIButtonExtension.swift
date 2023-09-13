//
//  UIButtonExtension.swift
//  HW17
//
//  Created by Роман Литвинович on 9.09.23.
//

import Foundation
import UIKit

extension UIButton {
    func roundButton() {
        layer.cornerRadius = frame.size.height / 2
        clipsToBounds = true
    }
}
