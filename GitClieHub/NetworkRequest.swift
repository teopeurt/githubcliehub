//
//  NetworkRequest.swift
//  GitClieHub
//
//  Created by don Onwunum on 03/05/2016.
//  Copyright © 2016 pigstycoders. All rights reserved.
//

import UIKit

import Alamofire
import PromiseKit
import ObjectMapper

class NetworkRequest: NSObject {
    
    class func getServicesWithPromise() -> Promise<AnyObject> {
        
        return Promise { fulfill, reject in
            
            
            let request = Alamofire.request(HiHo.Router.SearchCategory)
            
            request.responseJSON{ (response) in
                
                let statusCode = response.response?.statusCode
                
                if(response.result.error != nil) {
                    
                    return reject(response.result.error!)
                }
                
                if(statusCode < 200 || statusCode > 299) {
                    
                    return reject(NSError(domain: "domain", code: statusCode!, userInfo: [:]))
                }
                
                do {
                    let result = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions(rawValue: 0))
                    
                    fulfill(result)
                }catch {
                    return reject(NSError(domain:"hiho", code: statusCode!, userInfo: [NSLocalizedDescriptionKey:"Cant convert to a json object"]))
                }
            }
        }
    }


}
