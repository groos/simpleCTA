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
        return "select * from routes"
    }
    func getStopsByRouteUsing( #Stop:String?, AndLocation location:[String: Double]) -> String? {
        return "select * from routes"
    }
}
