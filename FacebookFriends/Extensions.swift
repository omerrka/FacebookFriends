//
//  Extensions.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 5.05.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
