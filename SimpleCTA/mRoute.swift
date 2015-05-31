//
//  mRoutes.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation

class Route {
    init(){}
    var stops:[Stop]? = nil
    let routeId:Int? = nil // db: route_id t: rn
    let routeShortName: String? = nil // db: route_short_name t: rt b: rt
    let routeType : Int? = nil // db: route_type , ie bus / train
    let routeDirection: String? = nil // B: rtdir
    let finalDestination : String? = nil// b: des t: destSt
}
