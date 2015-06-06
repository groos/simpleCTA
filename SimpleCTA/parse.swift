//
//  parse.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation
var ROUTES = NSMutableDictionary()

// Holds the current set of keys available for ROUTES
// THIS POPULATES TOP UITABLEVIEW
var ROUTES_KEYS = NSMutableArray()

// Holds ETA dictionaries for the selected line
// THIS POPULATES BOTTOM UITABLEVIEW
var ACTIVE_ROUTE_DETAILS = NSMutableArray()

var parser = Parse()
///////////////////////////////////////////////////////////////////////////////////////////////

class Parse: NSObject, NSXMLParserDelegate {
    
    //http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=25924988075841f2970d3e7f95c8070c&mapid=40930
    //http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=25924988075841f2970d3e7f95c8070c&mapid=40380&max=5
    
    var URLRequest = NSURL(string: "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=25924988075841f2970d3e7f95c8070c&mapid=40930")
    
    /* Here is the xml object we want.
    or paste this in browser: http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=25924988075841f2970d3e7f95c8070c&mapid=40380&max=5
    
    <eta>
    <staId>40380</staId>
    <stpId>30074</stpId>
    <staNm>Clark/Lake</staNm>
    <stpDe>Service at Inner Loop platform</stpDe>
    <rn>015</rn>
    <rt>G</rt>
    <destSt>30057</destSt>
    <destNm>Ashland/63rd</destNm>
    <trDr>5</trDr>
    <prdt>20150517 17:20:12</prdt>
    <arrT>20150517 17:23:12</arrT>
    <isApp>0</isApp>
    <isSch>0</isSch>
    <isDly>0</isDly>
    <isFlt>0</isFlt>
    <flags/>
    <lat>41.88556</lat>
    <lon>-87.65292</lon>
    <heading>89</heading>
    </eta>
    */
    
    
    // used throughout parsing for collecting xml attributes.
    // The elements dictionary gets added to ROUTES at the end of parsing
    var elements = NSMutableDictionary()
    var element = NSString()
    
    // used as a stringbuilders for these attributes
    // will want to add more later on.
    var staID = NSMutableString()
    var arrT = NSMutableString()
    var rn = NSMutableString()
    var rt = NSMutableString()
    var destination = NSMutableString()
    
    // custom function to set up and call superclass parser methods (below)
    @IBAction func myParse(){
        ROUTES.removeAllObjects()
        var xmlParser = NSXMLParser(contentsOfURL: URLRequest)
        xmlParser?.delegate = self
        xmlParser?.parse()
        updateRoutes()
    }
    
    func setAndRun(url: String, routes: String) {
        setUrl(url)
        myParse()
        updateRoutes()
    }
    
    func setUrl(url: String){
        URLRequest = NSURL(string: url)
    }
    
    //
    func updateRoutes(){
        ROUTES_KEYS.removeAllObjects()
        ACTIVE_ROUTE_DETAILS.removeAllObjects()
        
        var k = ROUTES.keyEnumerator()
        for key in k {
            ROUTES_KEYS.addObject(key)
            println("added key " + (key as! String))
        }
    }
    
    // call this when user touches a Route from upper UITableView
    func updateRouteDetails(route: String){
        println("trying to update route details for: " + route)
        
        if let d = ROUTES[route] as? NSMutableArray {
            println("got routes of route")
            for eta in d {
                //println("added details for route " + route)
                ACTIVE_ROUTE_DETAILS.addObject(eta)
            }
        }
    }
    
    
    // First superclass parser function that gets called. Stop it on the object name you want (eta object is below)
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        
        // store current element name in outer class
        // so it can referenced from other parser method
        element = elementName
        
        if (elementName as NSString).isEqualToString("eta"){
            elements = NSMutableDictionary.alloc()
            elements = [:]
            staID = NSMutableString.alloc()
            staID = ""
            arrT = NSMutableString.alloc()
            arrT = ""
            rn = NSMutableString.alloc()
            rn = ""
            rt = NSMutableString.alloc()
            rt = ""
            destination = NSMutableString.alloc()
            destination = ""
        }
    }
    
    // Second parser func that gets called throughout.
    // gets actual data inside tags
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        if element.isEqualToString("staID"){
            staID.appendString(string)
        } else if element.isEqualToString("arrT"){
            arrT.appendString(string)
        } else if element.isEqualToString("rn"){
            rn.appendString(string)
        } else if element.isEqualToString("rt"){
            rt.appendString(string)
        } else if element.isEqualToString("destNm"){
            destination.appendString(string)
        }
    }
    
    // the last parser fun that gets called.
    // called when finding a closing element. Adds the finished strings to dictionary
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!)
    {
        if (elementName as NSString).isEqualToString("eta") {
            if !staID.isEqual(nil) {
                elements.setObject(staID, forKey: "staID")
            }
            if !arrT.isEqual(nil) {
                elements.setObject(arrT, forKey: "arrT")
            }
            if !rn.isEqual(nil) {
                elements.setObject(rn, forKey: "rn")
            }
            if !rt.isEqual(nil){
                elements.setObject(rt, forKey: "rt")
            }
            if !destination.isEqual(nil){
                elements.setObject(destination, forKey: "destNm")
            }
            
            /*
            redefine posts (let's call it Lines) to be a dictionary of arrays
            
            // this would be a private variable at the top of class
            var Lines = NSMutableDictionary()
            
            // get routeID string from the current xml
            // this name needs to be consistent with names user selects from Main TableView
            var L = elements("rt")
            
            if posts[L] is nil {
            posts[L] = new NSMutableArray()
            posts[L].addObject(elements)
            } else {
            posts[L].addObject(elements)
            }
            */
            
            
            // rt will be something like "blue" or "R" indicating a Route.
            // we will store an array of arrival data objects for each Route
            if let rt = elements["rt"] as? String {
                
                // if we have already created an array for this Route, add the elements to it
                
                
                if let route = ROUTES[rt] as? NSMutableArray{
                    ROUTES[rt]!.addObject(elements)
                    println("added a new object for a line")
                    
                    
                } else {
                    // array for this Route doesn't exist yet, so create a new one
                    ROUTES[rt] = NSMutableArray()
                    ROUTES[rt]!.addObject(elements)
                    println("created new line array and added an object")
                    println(rt)
                }
                
            } else {
                println("didnt get anything back for rt")
            }
            
        }
    }
    

    
}
