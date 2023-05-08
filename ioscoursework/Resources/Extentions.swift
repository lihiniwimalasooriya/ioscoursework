//
//  Extentions.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-08.
//

import Foundation
import UIKit

extension UIView{
    var width: CGFloat{
        return frame.size.width
    }
    var height: CGFloat{
        return frame.size.height
    }
    var left: CGFloat{
        return frame.origin.x
    }
    var right: CGFloat{
        left+width
    }
    var top: CGFloat{
        return frame.origin.y
    }
    var bottom: CGFloat{
        return top+height
    }
}
