//
//  MTLayerDelegate.swift
//  MTBlogDemos
//
//  Created by LiMengtian on 2018/4/6.
//  Copyright © 2018 LiMengtian. All rights reserved.
//

import UIKit

class MTLayerDelegate: NSObject {
    
    fileprivate func loadImageFromBundle() -> CGImage? {
        return UIImage.init(named: "start")?.cgImage
    }
    
}

extension MTLayerDelegate: CALayerDelegate {
    
    //当`setNeedsDisplay`被调用后，会调用该方法
//    func display(_ layer: CALayer) {
//        if let image = self.loadImageFromBundle() {
//            layer.bounds = CGRect(x: 0, y: 0, width: image.width, height: image.height)
//            layer.contents = image
//        }
//    }
    
    func draw(_ layer: CALayer, in ctx: CGContext) {
        let path = CGMutablePath()
        
        path.move(to: .zero)
        path.addRect(CGRect(x: 0, y: 0, width: 100, height: 100))
        
        ctx.setLineWidth(5.0)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.addPath(path)

        ctx.strokePath()
    }
    
    func layerWillDraw(_ layer: CALayer) {
        
    }
    
    func layoutSublayers(of layer: CALayer) {
        
    }
    
    func action(for layer: CALayer, forKey event: String) -> CAAction? {
        guard event == "moveRight" else {
            return nil
        }
        
        let animation = CABasicAnimation()
        animation.valueFunction = CAValueFunction.init(name: kCAValueFunctionTranslateX)
        animation.fromValue = 1
        animation.toValue = 300
        animation.duration = 2
        
        return animation
    }
}

