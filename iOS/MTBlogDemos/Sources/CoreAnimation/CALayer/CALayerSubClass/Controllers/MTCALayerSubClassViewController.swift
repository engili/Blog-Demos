//
//  MTCALayerSubClassViewController.swift
//  MTBlogDemos
//
//  Created by LiMengtian on 2018/4/7.
//  Copyright © 2018 LiMengtian. All rights reserved.
//

import UIKit

class MTCALayerSubClassViewController: MTViewController {
    
    fileprivate var mtLayer: MTLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()     
        self.setupLayer()
    }
    
    fileprivate func setupLayer() {
        mtLayer = MTLayer()
        mtLayer.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        mtLayer.backgroundColor = UIColor.red.cgColor
        
        self.view.layer.addSublayer(mtLayer)
        
        mtLayer.setNeedsDisplay()
    }
}
