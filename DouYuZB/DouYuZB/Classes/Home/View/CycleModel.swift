//
//  CycleModel.swift
//  DouYuZB
//
//  Created by azu on 2020/7/22.
//  Copyright © 2020 azu. All rights reserved.
//

import UIKit

class CycleModel: NSObject {

    @objc var title :String = ""
    @objc var pic_url:String = ""
    @objc var room : [String:Any]?{
        didSet{
            guard let room = room else {
                return
            }
            anchor = AnchorModel(dict: room)
        }
    }
    @objc var anchor:AnchorModel?
    
    init(dict:[String:Any]) {
        
        super.init()
        
        setValuesForKeys(dict)
        
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
}
