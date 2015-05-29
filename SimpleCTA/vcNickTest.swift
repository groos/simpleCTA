//
//  vcNickTest.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/26/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import UIKit

class vcNickTest: UIViewController, NSXMLParserDelegate {
    
    //http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=25924988075841f2970d3e7f95c8070c&mapid=40930
    //http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=25924988075841f2970d3e7f95c8070c&mapid=40380&max=5
    
    let url = NSURL(string: "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=25924988075841f2970d3e7f95c8070c&mapid=40930")
    
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
    
    /*
        ROUTES is the top level data structure
    
        it looks like this:
    
        ROUTES[
                "blue" : [ETA Dictionary1, ETA Dictionary2, ETA Dictionary3],
                "Org" : [ETA Dictionary1, ETA Dictionary2, ETA Dictionary3]
            ]
    */
    var ROUTES = NSMutableDictionary()
    
    
    
    // use throughout parsing for collecting xml attributes.
    // The elements dictionary
    var elements = NSMutableDictionary()
    var element = NSString()
    
    // used as a stringbuilders for these attributes
    // will want to add more later on.
    var staID = NSMutableString()
    var arrT = NSMutableString()
    var rn = NSMutableString()
    var rt = NSMutableString()
    
    // custom function to set up and call superclass parser methods (below)
    @IBAction func myParse(){
        ROUTES = [:]
        var xmlParser = NSXMLParser(contentsOfURL: url)
        xmlParser?.delegate = self
        xmlParser?.parse()
        showParsedResults()
    }
    
    // gets parsed data and puts it on screen
    // call this once the parsing is finished, and access dictionaries of data
    func showParsedResults(){
        println("blank")
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
            
            
            // rt will be something like "blue" or "R" indicating a line.
            // we will store an array of arrival data objects for each line
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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
