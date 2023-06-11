//
//  Extension.swift
//  ChattyChat
//
//  Created by Manu on 11/06/23.
//

import UIKit
extension UIImage{
    var isPotrait: Bool{
        return size.height > size.width
    }
    var isLandscape: Bool{
        return size.height < size.width
    }
    
    var breadth: CGFloat {
        return min(size.width, size.height)
    }
    
    var breadthSize: CGSize{
        CGSize(width: breadth, height: breadth)
    }
    
    var breadthRect: CGRect{
        CGRect(origin: .zero, size: breadthSize)
    }
    
    var circleMasked: UIImage?{
        defer {
            UIGraphicsEndImageContext()
        }
        
        UIGraphicsBeginImageContextWithOptions(breadthSize, false, scale)
        guard let cgImage = cgImage?.cropping(to: CGRect(origin: CGPoint(x: isLandscape ? floor(size.width - size.height) / 2 : 0 , y: isPotrait ? floor(size.height - size.height) / 2 : 0), size: breadthSize)) else { return nil}
        UIBezierPath(ovalIn: breadthRect).addClip()
        UIImage(cgImage: cgImage).draw(in: breadthRect)
        return UIGraphicsGetImageFromCurrentImageContext()
        
    }
}


extension Date{
    func longDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: self)
    }
    
}
