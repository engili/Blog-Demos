//
//  UIColor+MTExtension.swift
//  MTBlogDemos
//
//  Created by LiMengtian on 2018/4/21.
//  Copyright © 2018 LiMengtian. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func mt_colorFromARGB(_ argb:UInt32) -> UIColor {
        return UIColor.init(red:   CGFloat((argb & 0xFF0000) >> 16)   / 255.0,
                            green: CGFloat((argb & 0x00FF00) >>  8)   / 255.0,
                            blue:  CGFloat( argb & 0x0000FF)          / 255.0,
                            alpha: CGFloat((argb & 0xFF000000) >> 24) / 255.0)
    }
}
