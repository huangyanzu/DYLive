//
//  CollectionNormalCell.swift
//  DouYuZB
//
//  Created by azu on 2020/7/21.
//  Copyright © 2020 azu. All rights reserved.
//

import UIKit

class CollectionNormalCell: UICollectionViewCell {

    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var iconImageView: UIImageView!
    
 
    @IBOutlet weak var nickNameLabel: UILabel!
    
    @IBOutlet weak var roomNameLabel: UILabel!
    
    
    var anchor:AnchorModel?{
        didSet{
            guard let anchor = anchor else{return}
            var  onlineStr : String = ""
            
            if anchor.online >= 10000{
                onlineStr = "\(Int(anchor.online/10000))万在线"
            }else{
                onlineStr = "\(anchor.online)在线"
            }
            
            onlineBtn.setTitle(onlineStr, for: [])
            
            nickNameLabel.text = anchor.nickname
            
           
           roomNameLabel.text = anchor.room_name 
            
            
            
            guard let url = URL(string: anchor.vertical_src) else{return}
            
            iconImageView.kf.setImage(with: url)
        }
    }
}
