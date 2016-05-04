//
//  GithubRouter.swift
//  GitClieHub
//
//  Created by don Onwunum on 03/05/2016.
//  Copyright © 2016 pigstycoders. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

struct Github {
    enum Router : URLRequestConvertible {
        
        case SearchCategory
        
        var method: Alamofire.Method {
            switch self {
            case .SearchCategory:
                return .POST
            default:
                return .GET
                
            }
            
        }
        
        var URLRequest: NSMutableURLRequest {
            
            let (path, parameters): (String, [String: AnyObject]) = {
                
                switch self {
                case .SearchCategory:
                    let params = [String: AnyObject]() // empty dictionary
                    return ("/servicecategory", params)
                    
                }
            }()
        }
        
        //let URLRequest = NSMutableURLRequest(URL: URL!.URLByAppendingPathComponent(path)) //?
        //URLRequest.HTTPMethod = method.rawValue
        
        //let encoding = Alamofire.ParameterEncoding.URL //?
        
        switch self {
//            case .SearchCategory(_): //post ...
//                return Alamofire.ParameterEncoding.JSON.encode(URLRequest, parameters: parameters).0
            default:
                return encoding.encode(URLRequest, parameters: parameters).0 // get requests..
        }
        

}
