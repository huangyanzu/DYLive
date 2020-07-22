//
//  AnchorModel.swift
//  DouYuZB
//
//  Created by azu on 2020/7/22.
//  Copyright © 2020 azu. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {

    @objc var room_id : Int = 0
    @objc var vertical_src :String = ""
    @objc var isVertical :Int = 0
    @objc var room_name :String = ""
    @objc var online : Int = 0
    @objc var nickname:String = ""
    @objc var anchor_city:String = "" 
    
    init(dict:[String :Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
