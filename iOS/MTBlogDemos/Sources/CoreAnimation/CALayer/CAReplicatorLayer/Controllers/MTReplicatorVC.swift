//
//  MTReplicatorVC.swift
//  MTBlogDemos
//
//  Created by LiMengtian on 2018/4/21.
//  Copyright © 2018 LiMengtian. All rights reserved.
//

import UIKit

class MTReplicatorVC: MTViewController {
    
    var replicatorView: MTReplicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        replicatorView = MTReplicatorView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(replicatorView)
    }
}
