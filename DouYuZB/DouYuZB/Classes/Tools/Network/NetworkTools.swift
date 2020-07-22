//
//  NetworkTools.swift
//  DouYuZB
//
//  Created by azu on 2020/7/21.
//  Copyright © 2020 azu. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType{
    case GET
    case POST
}


class NetworkTools  {
    
    class func requestData(type:MethodType ,URLString:String ,parameters :[String:String]? = nil , finishedCallback:@escaping(_ result :Any)->()){
        
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        
       
        
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
               guard let result = response.result.value else{
                
                print(response.result.error as Any)
                return
            }
            
            finishedCallback(result)
            
        }
        
        
        
    }
    

}
