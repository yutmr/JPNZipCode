//
//  JPNZipCode.swift
//
//  Created by YuTamura on 2015/03/15.
//  Copyright (c) 2015年 YuTamura. All rights reserved.
//

import Foundation


public class JPNZipCode {

    class public func get(zipCode: String!, completionHandler: ((NSDictionary?, NSError?) -> Void)) {
        var URL     = NSURL(string: "http://api.zipaddress.net?zipcode=" + zipCode)
        var config  = NSURLSessionConfiguration.defaultSessionConfiguration()
        var session = NSURLSession(configuration: config)
        var task    = session.dataTaskWithURL(URL!, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                completionHandler(nil, error)
            }

            var jsonError: NSError?
            var json: NSDictionary? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as? NSDictionary
            if jsonError != nil {
                completionHandler(nil, jsonError)
            }
            
            completionHandler(json, nil)
        })
        task.resume()
    }
}



