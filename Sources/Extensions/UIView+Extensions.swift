//
//  UIView+Extensions.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import UIKit

extension UIView {
    func cornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
    }

    func addBorder(color: UIColor?, width: CGFloat) {
        layer.borderWidth = width
        layer.borderColor = color?.cgColor
    }
}
