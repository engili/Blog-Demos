//
//  MTCAGradientLayerViewController.swift
//  MTBlogDemos
//
//  Created by LiMengtian on 2018/4/5.
//  Copyright © 2018 LiMengtian. All rights reserved.
//

import UIKit

class MTCAGradientLayerViewController: MTViewController {
    
    fileprivate var gradientView: MTGradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect.init(x: 100, y: 200, width: 200, height: 200)
        gradientView = MTGradientView(frame: frame)
        
        self.view.addSubview(gradientView)
    }
}
