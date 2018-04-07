//
//  MTLayerDelegateViewController.swift
//  MTBlogDemos
//
//  Created by LiMengtian on 2018/4/6.
//  Copyright © 2018 LiMengtian. All rights reserved.
//

import UIKit

class MTLayerDelegateViewController: MTViewController {

    fileprivate var startLayer: CALayer!
    fileprivate var layerDelegate: MTLayerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupLayer()
    }
    //MARK: - UI
    
    fileprivate func setupLayer() {
        layerDelegate = MTLayerDelegate()
        
        startLayer = CALayer()
        startLayer.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        startLayer.delegate = layerDelegate
        
        self.view.layer.addSublayer(startLayer)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
             self?.startLayer.setNeedsDisplay()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.moveLayerToRight()
        }
    }
    
    fileprivate func moveLayerToRight() {
        guard let action = startLayer.action(forKey: "moveRight") else {
            return
        }
        
        action.run(forKey: "transform", object: startLayer, arguments: nil)
    }
}
