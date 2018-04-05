//
//  BlogDemosModel.swift
//  MTBlogDemos
//
//  Created by LiMengtian on 2018/4/5.
//  Copyright © 2018 LiMengtian. All rights reserved.
//

import Foundation

struct MTItemModel {
    
    init(itemName: String, subModels: [MTItemModel]? = nil) {
        self.itemName = itemName
        self.subModels = subModels
    }
    
    let itemName: String
    let subModels: [MTItemModel]?
}

struct MTBlogDemosModel {
    
    //目录
    static let index:[MTItemModel] = [
        MTItemModel.init(itemName: "UIKit", subModels: uiKitSubModels),
        MTItemModel.init(itemName: "CoreAnimation", subModels: coreAnimationsSubModels)
    ]
    
    //1.0 UIKit
    fileprivate static let uiKitSubModels: [MTItemModel] = [
        MTItemModel.init(itemName: "Keyboard")
    ]
    
    //2.0 CoreAnimation
    fileprivate static let coreAnimationsSubModels: [MTItemModel] = [
        MTItemModel.init(itemName: "CALayer", subModels: calyerSubModels)
    ]
    
    //2.1 CALayer
    fileprivate static let calyerSubModels: [MTItemModel] = [
        MTItemModel.init(itemName: "CAGradientLayer"),
        MTItemModel.init(itemName: "CATextLayer")
    ]

    
}
