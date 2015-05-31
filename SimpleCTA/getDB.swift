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
    // and location? by just calling sql string builder heree?
    func getRoutesByLocation(sqlStatment:String?) -> [String?] {
        return ["Red", "Brown", "80"]
    }
    
    func getStopsByRoute(Route:String?) -> [String?] {
        return ["Fullerton","Bellmount", "Addison"]
    }
}
