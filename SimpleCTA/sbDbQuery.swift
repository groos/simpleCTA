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
        return (
            "SELECT DISTINCT r.route_id,  " +
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
            "AND r.r_pk = rds.r_pk  " +
            "AND s.stop_lat BETWEEN (41.87659463 - .005) AND (41.87659463 + .005)  " +
            "AND s.stop_lon BETWEEN (-87.75461526 - .005) AND (-87.75461526 + .005)  "
        )
    }
    func getStopsByRoute( route:String?, AndLocation location:[String: Double]) -> String? {
        return "SELECT r.route_id,      " +
            "r.route_long_name,   " +
            "r.route_style,   " +
            "s.stop_name,   " +
            "s.stop_lat,   " +
            "s.stop_lon,   " +
            "d.direction   " +
            "s.stop_id  " +
            "FROM routes_stops AS rs,   " +
            "stops AS s,   " +
            "routes AS r,   " +
            "routes_directions AS rds,   " +
            "directions as d   " +
            "WHERE s.stop_id = rs.stop_id   " +
            "AND r.r_pk = rs.r_pk   " +
            "AND s.stop_id = rs.stop_id   " +
            "AND r.r_pk = rds.r_pk   " +
            "AND d.direction_id = rds.direction_id   " +
            "and r.route_id = 49   " +
            "AND s.stop_lat BETWEEN (41.87659463 - .001 ) AND (41.87659463 + .001)   " +
            "AND s.stop_lon BETWEEN (-87.75461526 - .1) AND (-87.75461526 + .09)   "
    }
}
