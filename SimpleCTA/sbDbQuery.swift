//
//  sbDbQuery.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation
//import Stop

class DbQueryBuilder {

    func GetRoutesByLocation(location:[String: Double]) -> String?{
            var statement = "SELECT DISTINCT r.route_id,  " +
                "r.route_long_name,  " +
                "r.route_type,  " +
                "r.route_style  " +
                "FROM routes_stops AS rs,  " +
                "stops AS s,  " +
                "routes AS r,  " +
                "routes_directions AS rds  " +
                "WHERE s.stop_id = rs.stop_id  " +
                "AND r.r_pk = rs.r_pk  " +
                "AND s.stop_id = rs.stop_id  " +
                "AND r.r_pk = rds.r_pk  "
        
            if let radius = whereSeachRadius() {
                statement += radius
            }
            if let direction = whereDirections() {
                statement += direction
            }
            if let routeType = whereRouteType () {
                statement += routeType
            }
            //print(statement)
            return statement
        }
    
    func getStopsByRoute(route:String?) -> String {
        
       var statement = "SELECT distinct r.route_id, " +
        "r.route_long_name,    " +
        "r.route_style,    " +
        "s.stop_name,    " +
        "s.stop_lat,    " +
        "s.stop_lon,    " +
        "s.stop_id,  " +
        "d.direction    " +
        "FROM routes_stops AS rs,    " +
        "stops AS s,    " +
        "routes AS r,    " +
        "routes_directions AS rds,    " +
        "directions as d    " +
        "WHERE s.stop_id = rs.stop_id    " +
        "AND r.r_pk = rs.r_pk    " +
        "AND s.stop_id = rs.stop_id    " +
        "AND r.r_pk = rds.r_pk    " +
        "AND d.direction_id = rds.direction_id    "
            
        if let r = route {
           statement += " and r.route_id = \'\(r)\' "
        }
        if let radius = whereSeachRadius() {
            statement += radius
        }
        if let direction = whereDirections() {
            statement += direction
        }
        if let routeType = whereRouteType () {
            statement += routeType
        }
        //print(statement)
        return statement
    }
    
    func whereSeachRadius() -> String? {
        if let radius = Settings.searchRadius, gps = GPS.getUserLocation() {
            let lon = gps["longitude"]!; let lat = gps["latitude"]!
            let xy =  " AND s.stop_lat BETWEEN ( \(lat) - \(radius) ) AND  ( \(lat) + \(radius) ) " +
                      " AND s.stop_lon BETWEEN ( \(lon) - \(radius) ) AND  ( \(lon) + \(radius) ) "
        
        return xy
    }
    
    return nil
    }
    
    func whereDirections()  -> String? {
        
        var directions : String? = nil
        var isFirst = true
        
       if dbParams["N"]! == true {
          directions = " 1 "; isFirst = false 
        }
        if dbParams["S"]! == true {
            if isFirst == false { directions! += " ,2 "} else { directions = " 2 "; isFirst = false }
        }
        if dbParams["E"]! == true {
            if isFirst == false { directions! += " ,3 "} else { directions = " 3 "; isFirst = false }
        }
        if dbParams["W"]! == true {
            if isFirst == false { directions! += " ,4 "} else { directions = " 4 "; isFirst = false }
        }
        return isFirst == true ? nil : " AND d.direction_id in (\(directions!)) "
    }
    
    func whereRouteType () -> String? {
        var routeType: String?
        var isFirst = true
        
        if dbParams["Bus"]! == true {
            if isFirst == true {
                routeType = " 3 "
                isFirst = false
            }
        }
        if dbParams["Train"]! == true {
            if isFirst == true {
                routeType = " 1 "
                isFirst = false
            } else {
                routeType! += " ,1 " ;
            }
        }
         if let ret = routeType { let x =  " AND r.route_type in ( \(ret) ) "; return x } else { return nil }
    }
}


