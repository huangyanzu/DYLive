//
//  NSDate+Extension.swift
//  DouYuZB
//
//  Created by azu on 2020/7/22.
//  Copyright © 2020 azu. All rights reserved.
//

import Foundation

extension NSDate {
    class func getCurrentTime()-> String{
        let nowDate = NSDate()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        return "\(interval)"
    }
}
