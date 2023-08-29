//
//  UIImage+.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/29.
//

import UIKit

extension UIImage {
    
    func designCircleThumbnail() -> UIImage {
        let spacing: CGFloat = 12
        let screenWidth = (UIScreen.main.bounds.size.width - (spacing * 4)) / 4
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: screenWidth, height: screenWidth))
        let renderedImage = renderer.image { context in
            context.cgContext.setFillColor(UIColor.black.cgColor)
            context.cgContext.setStrokeColor(UIColor.white.cgColor)
            context.cgContext.setLineWidth(2)
            
            let rectangle = CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth)
            context.cgContext.addEllipse(in: rectangle)
            context.cgContext.drawPath(using: .fillStroke)
        }
        return renderedImage
    }
}
