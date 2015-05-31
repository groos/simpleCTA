//
//  getHttp.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation

class getXml {
    
    
    init (){}
    
    func getPerdictions(httpUrl:String?) -> NSString? {
        let myURLString = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=25924988075841f2970d3e7f95c8070c&mapid=40930"
        var myHTMLString:NSString?
    
        if let myURL = NSURL(string: myURLString) {
            var error: NSError?
            myHTMLString = NSString(contentsOfURL: myURL, encoding: NSUTF8StringEncoding, error: &error)
            if let xml = myHTMLString {
                return xml
            }
            else  {
                return nil
            }
        } else {
            return nil
        }
    }
    
    /// might not need this maybe all could be done in one.....
    func getBusXmlPerdictions(httpRequest:String?) -> NSString? {
        let myURLString = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=25924988075841f2970d3e7f95c8070c&mapid=40930"
        var myHTMLString:NSString?
    
        if let myURL = NSURL(string: myURLString) {
            var error: NSError?
            myHTMLString = NSString(contentsOfURL: myURL, encoding: NSUTF8StringEncoding, error: &error)
    
            if let xml = myHTMLString {
                return xml
            } else  {
                return nil
            }
        } else {
            return nil
        }
    }
}
