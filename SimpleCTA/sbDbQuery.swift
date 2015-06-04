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
        
        
        return (  " select distinct r.route_id, r.route_long_name, r.route_type, " +
            "rds.direction_id " +
            "from routes_stops as rs, stops as s, routes as r, routes_directions as rds " +
            "where s.stop_id = rs.stop_id " +
            "and r.r_pk = rs.r_pk " +
            "and s.stop_id = rs.stop_id " +
            "and r.r_pk = rds.r_pk " +
            "and rds.direction_id in (1,2,0) " +
            "and r.route_type = 3 " +
            "and s.stop_lat between (41.87659463  - .1) and (41.87659463 + .1) " +
        "and s.stop_lon between  (-87.75461526 - .1) and (-87.75461526 + .1) ")
    }
    func getStopsByRouteUsing( #Stop:String?, AndLocation location:[String: Double]) -> String? {
        return "select * from routes"
    }
}
