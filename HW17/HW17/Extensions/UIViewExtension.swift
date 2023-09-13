//
//  UIViewExtension.swift
//  HW17
//
//  Created by Роман Литвинович on 9.09.23.
//

import Foundation
import UIKit

extension UIView {
    func roundView() {
        layer.cornerRadius = 30
        clipsToBounds = true
    }
    
    func roundViewForHeight() {
        layer.cornerRadius = frame.size.height / 2
        clipsToBounds = true
    }
}
