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
    //return
    }
    
  //  if !database.executeUpdate("create table test(x text, y text, z text)", withArgumentsInArray: nil) {
//    println("create table failed: \(database.lastErrorMessage())")
//    }
//    
//    if !database.executeUpdate("insert into test (x, y, z) values (?, ?, ?)", withArgumentsInArray: ["a", "b", "c"]) {
//    println("insert 1 table failed: \(database.lastErrorMessage())")
//    }
//    
//    if !database.executeUpdate("insert into test (x, y, z) values (?, ?, ?)", withArgumentsInArray: ["e", "f", "g"]) {
//    println("insert 2 table failed: \(database.lastErrorMessage())")
//    }
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // and location? by just calling sql string builder heree?

    func getStopsByLocation (sqlStatment:String?) -> [String]? {
        return ["asdf"]
    }
    func getStopsByRoute(sqlStatment:String?) -> [String]? {
        return ["Fullerton","Bellmount", "Addison"]
    }
}
