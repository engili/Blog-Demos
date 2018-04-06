//
//  MTGradientView.swift
//  MTBlogDemos
//
//  Created by LiMengtian on 2018/4/5.
//  Copyright © 2018 LiMengtian. All rights reserved.
//

import UIKit

class MTGradientView: UIView {
    
    override class var layerClass: Swift.AnyClass  {
        return CAGradientLayer.self
    }

    //MARK:- Public Property
    var colors: [Any]? {
        set { gradientLayer?.colors = colors }
        get { return gradientLayer?.colors }
    }
    var locations: [NSNumber]? {
        set { gradientLayer?.locations = locations }
        get { return gradientLayer?.locations}
    }
    
    var startPoint: CGPoint? {
        set {
            if let pointValue = startPoint {
                gradientLayer?.startPoint = pointValue
            }
        }
        get { return gradientLayer?.startPoint }
    }
    
    var endPoint: CGPoint? {
        set {
            if let pointValue = endPoint {
                gradientLayer?.endPoint = pointValue
            }
        }
        get { return gradientLayer?.endPoint }
    }
    
    //MARK: - Private Property
    
     fileprivate var gradientLayer: CAGradientLayer? {
        get {
            return self.layer as? CAGradientLayer
        }
    }
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayer()
    }
    
    fileprivate func setupLayer() {
        gradientLayer?.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        gradientLayer?.locations = [0.5,1]
        gradientLayer?.startPoint = .zero
        gradientLayer?.endPoint = CGPoint(x: 1, y: 1)
    }
}
