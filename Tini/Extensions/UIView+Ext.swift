//
//  UIView+Ext.swift
//  Tini
//
//  Created by Omodauda on 02/12/2024.
//

import UIKit

extension UIView {
    
    func pinToEdges(of superview: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
}
