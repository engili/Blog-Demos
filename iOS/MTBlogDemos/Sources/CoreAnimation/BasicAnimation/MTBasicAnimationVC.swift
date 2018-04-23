//
//  MTBasicAnimationVC.swift
//  MTBlogDemos
//
//  Created by LiMengtian on 2018/4/21.
//  Copyright © 2018 LiMengtian. All rights reserved.
//

import UIKit

class MTBasicAnimationVC: MTViewController {
    
    fileprivate var redView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        redView = UIView(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        redView.backgroundColor = UIColor.red
        
        self.view.addSubview(redView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.doAnimation()
    }
    
    fileprivate func doAnimation() {
        let animation = CABasicAnimation(keyPath: "position.x")
        
        animation.fromValue = NSNumber(floatLiteral:  Double(redView.layer.position.x))
        animation.toValue = NSNumber(floatLiteral: 100.0)
        animation.duration = 3.0
        
        self.redView.layer.add(animation, forKey: "fadeAnimation")
        
        //设置成最终的值
//        self.redView.layer.opacity = 0.0
        
    }
    
    

}
