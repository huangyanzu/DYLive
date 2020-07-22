//
//  UIBarButtonItem-Extension.swift
//  DouYuZB
//
//  Created by azu on 2020/7/19.
//  Copyright © 2020 azu. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
//    class func createItem(imageName:String,highImageName:String,size:CGSize) -> UIBarButtonItem {
//        let btn = UIButton()
//        btn.setImage(UIImage(named: imageName), for: [])
//        btn.setImage(UIImage(named: highImageName), for: .highlighted)
//        
//        btn.frame = CGRect(origin: CGPoint.zero, size: size)
//        
//        return UIBarButtonItem(customView: btn)
//    }
//    
    
   convenience init(imageName:String,highImageName:String = "" ,size:CGSize = CGSize.zero) {
    
        let btn = UIButton()
    
        btn.setImage(UIImage(named: imageName), for: [])
    
    if highImageName != ""{
        
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
    }
    
    if size == CGSize.zero{
        btn.sizeToFit()
    }else{
        
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
    }
    
    
        self.init(customView: btn)
    }
    
}

