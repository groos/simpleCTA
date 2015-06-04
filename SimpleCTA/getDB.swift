//
//  getDB.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation

class DB {
    init(){}
    func dbtest() -> [Route]?   {
    let documentsFolder = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
    let path = documentsFolder.stringByAppendingPathComponent("SimpleCta.sqlite")
    
    let database = FMDatabase(path: path)
    
    if !database.open() {
    println("Unable to open database")
    }

    var route : [Route] = []
    let a = DbQueryBuilder().GetRoutesByLocation(["asdf":4.4])
    if let rs = database.executeQuery(a!, withArgumentsInArray: nil) {
        while rs.next() {
            let x = rs.stringForColumn("route_id")
            let y = rs.stringForColumn("route_long_name")
            let z = rs.stringForColumn("route_type")
            let r = Route(rId: x.toInt(), rtShortName: nil, rtLN: y, rtType: z.toInt(), rtDirection: nil, final: nil)
             route.append(r)
          
            println("\(x)")
        }
    } else {
        println("select failed: \(database.lastErrorMessage())")
        }//r.route_id, r.route_long_name, r.route_type
        database.close()
        return route
    }
    
    
    
    
    func DownloadDatabase() {
        if let audioUrl = NSURL(string: "http://www.pdhawk.com/SimpleCta.sqlite") {
            // create your document folder url
            let documentsUrl =  NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first as! NSURL
            // your destination file url
            let destinationUrl = documentsUrl.URLByAppendingPathComponent(audioUrl.lastPathComponent!)
            println(destinationUrl)
            // check if it exists before downloading it
            if NSFileManager().fileExistsAtPath(destinationUrl.path!) {
                println("The file already exists at path")
            } else {
                //  if the file doesn't exist
                //  just download the data from your url
                if let myAudioDataFromUrl = NSData(contentsOfURL: audioUrl){
                    // after downloading your data you need to save it to your destination url
                    if myAudioDataFromUrl.writeToURL(destinationUrl, atomically: true) {
                        println("file saved")
                    } else {
                        println("error saving file")
                    }
                }
            }
        }
    }
    
    // and location? by just calling sql string builder heree?

    func getStopsByLocation (sqlStatment:String?) -> [String]? {
        return ["asdf"]
    }
    func getStopsByRoute(sqlStatment:String?) -> [String]? {
        return ["Fullerton","Bellmount", "Addison"]
    }
}
