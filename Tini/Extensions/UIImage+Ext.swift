//
//  UIImage+Ext.swift
//  Tini
//
//  Created by Omodauda on 05/01/2025.
//

import UIKit

extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        UIGraphicsBeginImageContext(size)
        defer {UIGraphicsEndImageContext()}
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(origin: .zero, size: size))
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {return nil}
        guard let cgImage = image.cgImage else {return nil}
        
        self.init(cgImage: cgImage)
    }
}
