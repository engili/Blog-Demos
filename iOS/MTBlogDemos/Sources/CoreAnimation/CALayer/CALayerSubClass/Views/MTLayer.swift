//
//  MTLayer.swift
//  MTBlogDemos
//
//  Created by LiMengtian on 2018/4/7.
//  Copyright © 2018 LiMengtian. All rights reserved.
//

import UIKit

class MTLayer: CALayer {
    
    override func display() {
        // super.display()
        // 会先去检查当前layer的delegate 是否存在 且实现了 display(_:) 方法，若实现了就调用delegate的方法
        // 若没有实现，则调用当前对象的 draw(in :) 方法
//        self.contents = loadStartImage()
    }
    
    override func draw(in ctx: CGContext) {
        let path = CGMutablePath()
        
        path.move(to: .zero)
        path.addRect(self.bounds)
        
        ctx.setLineWidth(5.0)
        ctx.setStrokeColor(UIColor.yellow.cgColor)
        
        ctx.addPath(path)
        ctx.strokePath()
    }
    
    fileprivate func loadStartImage() -> CGImage? {
        return UIImage(named: "start")?.cgImage
    }
}
