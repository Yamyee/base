//
//  UIColor+extension.swift
//  yybase
//
//  Created by yamyee on 2021/1/8.
//

import Foundation
extension UIColor{
    
    public func createImage()->UIImage?{
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        return context?.makeImage()
        
    }
}
