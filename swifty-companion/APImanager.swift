//
//  APImanager.swift
//  swifty-companion
//
//  Created by Gordon RASS-KWASI on 8/22/16.
//  Copyright © 2016 Gordon RASS-KWASI. All rights reserved.
//

import Foundation
import Alamofire
import OAuth2
import UIKit

public class APImanager {
    private let viewController: UIViewController!
    private let requester: APIRequester = APIRequester.sharedInstance
    
    public init(contextView: UIViewController) {
        viewController = contextView
    }
    
    public func authorize() {
        if requester.oauth2.hasUnexpiredAccessToken() == false {
//            let vc = try? requester.oauth2.authorizeSafariEmbeddedFromViewController(ViewController)
            do {
                let vc = try requester.oauth2.authorizeSafariEmbeddedFromViewController(viewController)
                requester.oauth2.afterAuthorizeOrFailure = { _, _ in
                    vc.dismissViewControllerAnimated(true, completion: nil)
                }
            } catch {
                print(error)
            }
        } else {
            requester.oauth2.authorize()
        }
    }
 
    public func request(method: Alamofire.Method,
                        _ URLString: URLStringConvertible,
                          parameters: [String : AnyObject]? = nil,
                          encoding: ParameterEncoding = .URL,
                          headers: [String : String]? = nil,
                          completionHandler: (Response<AnyObject, NSError>) -> ()) {
        
        self.requester.oauth2.onAuthorize = { _ in
            
            self.requester.oauth2.request(method,
                URLString,
                parameters: parameters,
                encoding: encoding,
                headers: headers)
                .validate()
                .responseJSON(completionHandler: { (response) in
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        
                        completionHandler(response)
                        
                    }
                    
                })
            
        }
        
        self.authorize()
        
    }
}

extension OAuth2 {
    public func request(
        method: Alamofire.Method,
        _ URLString: URLStringConvertible,
          parameters: [String: AnyObject]? = nil,
          encoding: Alamofire.ParameterEncoding = .URL,
          headers: [String: String]? = nil)
        -> Alamofire.Request
    {
        
        var hdrs = headers ?? [:]
        if let token = accessToken {
            hdrs["Authorization"] = "Bearer \(token)"
        }
        return Alamofire.request(
            method,
            URLString,
            parameters: parameters,
            encoding: encoding,
            headers: hdrs)
    }
}