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

// https://github.com/Alamofire/Alamofire#crud--authorization
// http://stackoverflow.com/questions/28333241/proper-usage-of-the-alamofires-urlrequestconvertible


struct Github {

    enum Router: URLRequestConvertible {
        static let baseURLString = "http://example.com"
        static var OAuthToken: String?
        
        case CreateUser([String: AnyObject])
        case ReadUser(String)
        case UpdateUser(String, [String: AnyObject])
        case DestroyUser(String)
        
        var method: Alamofire.Method {
            switch self {
            case .CreateUser:
                return .POST
            case .ReadUser:
                return .GET
            case .UpdateUser:
                return .PUT
            case .DestroyUser:
                return .DELETE
            }
        }
        
        var path: String {
            switch self {
            case .CreateUser:
                return "/users"
            case .ReadUser(let username):
                return "/users/\(username)"
            case .UpdateUser(let username, _):
                return "/users/\(username)"
            case .DestroyUser(let username):
                return "/users/\(username)"
            }
        }
        
        // MARK: URLRequestConvertible
        
        var URLRequest: NSMutableURLRequest {
            let URL = NSURL(string: Router.baseURLString)!
            let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
            mutableURLRequest.HTTPMethod = method.rawValue
            
            if let token = Router.OAuthToken {
                mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            }
            
            switch self {
            case .CreateUser(let parameters):
                return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
            case .UpdateUser(_, let parameters):
                return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
            default:
                return mutableURLRequest
            }
        }
        
        

        
    }

}