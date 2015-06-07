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
    
    func getRoutesByLocation() -> [PublicTransit]?   {
        let database = FMDatabase(path: self.getDBPath())
    
        if !database.open() { println("Unable to open database") }

        var route : [PublicTransit] = [Route]()
        let a = DbQueryBuilder().GetRoutesByLocation(["asdf":4.4])
        if let rs = database.executeQuery(a!, withArgumentsInArray: nil) {
            while rs.next() {
                let rid = rs.stringForColumn("route_id")
                let rln = rs.stringForColumn("route_long_name")
                let rt = rs.stringForColumn("route_type")
                let rs = rs.stringForColumn("route_style")
                let r = Route(rId:rid, rtShortName : nil, rtLN : rln, rtType : rt.toInt(), rtStyle: rs, rtDirection: nil, final: nil)
                route.append(r)
            }
        } else {
            println("select failed: \(database.lastErrorMessage())")
        }
        database.close()
        return route
    }
    
    func getDBPath () -> String? {
        let documentsFolder = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        return documentsFolder.stringByAppendingPathComponent("SimpleCta.sqlite")
    }
    
    
    func DownloadDatabase() {
        if let audioUrl = NSURL(string: "http://www.pdhawk.com/SimpleCta.sqlite") {
            // create your document folder url
            let documentsUrl =  NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first as! NSURL
            // your destination file url
            let destinationUrl = documentsUrl.URLByAppendingPathComponent(audioUrl.lastPathComponent!)
            println(destinationUrl)
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
    
    func getRouteLongName (routeKey rk:String?) -> String? {
        var route = "----"
        if let routeKey = rk {
            let contactDB = FMDatabase(path: self.getDBPath())
            
            if contactDB.open() {
                let querySQL = "SELECT route_long_name FROM ROUTES WHERE route_id = '" + routeKey + "'"
                
                let results:FMResultSet? = contactDB.executeQuery(querySQL, withArgumentsInArray: nil)
                
                if results?.next() == true {
                    if let r = results?.stringForColumn("route_long_name") {
                        route = r
                    }
                }
                contactDB.close()
            }
        }
        return route
    }
    
    func getStopsByRoute(route:String?) -> [PublicTransit]? {
        let database = FMDatabase(path: self.getDBPath())
        
        if !database.open() { println("Unable to open database") }
        
        var stop : [PublicTransit] = [Stop]()
        let a = DbQueryBuilder().getStopsByRoute(route)
        if let rs = database.executeQuery(a, withArgumentsInArray: nil) {
            while rs.next() {
                    var rid =   rs.stringForColumn("route_id")
                    var rln =   rs.stringForColumn("route_long_name")
                    var sn =    rs.stringForColumn("stop_name")
                    var style = rs.stringForColumn("route_style")
                    var slon =  rs.stringForColumn("stop_lon")
                    var slat =  rs.stringForColumn("stop_lat")
                    var rdir =  rs.stringForColumn("direction")
                    var sid =   rs.stringForColumn("stop_id")
            
                var s = Stop(rId: rid , sId: sid, sName: sn, routeLongName: rln, lat: (slat as NSString).doubleValue,
                        lon: (slon as NSString).doubleValue, rtDir: rdir, distance: 0.34, locType: nil, style: style)
                    stop.append(s)
                
                }
            } else {
                println("select failed: \(database.lastErrorMessage())")
            }
            database.close()
        
        return stop
    }
}