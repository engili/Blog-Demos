//
//  MTReplicatorView.swift
//  MTBlogDemos
//
//  Created by LiMengtian on 2018/4/21.
//  Copyright © 2018 LiMengtian. All rights reserved.
//

import UIKit

class MTReplicatorView: UIView {

    override class var layerClass: Swift.AnyClass {
        return CAReplicatorLayer.self
    }
    
    var replicatorLayer: CAReplicatorLayer? {
        return self.layer as? CAReplicatorLayer
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(ovalIn: self.bounds).cgPath
        shapeLayer.fillColor = UIColor.mt_colorFromARGB(0x8C551BFF).cgColor
        shapeLayer.frame  = self.bounds
        
        let basicAnimation = CABasicAnimation(keyPath: "transform")
        basicAnimation.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
        basicAnimation.toValue = NSValue(caTransform3D: CATransform3DMakeScale(0.5, 0.5, 1.0))
        basicAnimation.duration = 1.0
        basicAnimation.autoreverses = true
        basicAnimation.repeatCount = HUGE
        
        shapeLayer.add(basicAnimation, forKey: "asdasd")
        
        
        self.replicatorLayer?.instanceCount = 2
        self.replicatorLayer?.instanceDelay = 1
        self.replicatorLayer?.addSublayer(shapeLayer)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
