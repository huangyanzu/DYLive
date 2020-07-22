//
//  UIColor+Extension.swift
//  DouYuZB
//
//  Created by azu on 2020/7/20.
//  Copyright © 2020 azu. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r:CGFloat , g:CGFloat , b:CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0 , blue: b / 255.0, alpha: 1.0)
        
    }
}
