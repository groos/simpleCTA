//
//  mRoutes.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation

class Route {
    
    var stops:[Int : Stop]?
    let routeId:Int?                // db: route_id t: rn
    let routeShortName: Int?     // db: route_short_name t: rt b: rt
    let routeLongName: String?
    let routeType : Int?            // db: route_type , ie bus / train
    let routeDirection: String?     // B: rtdir
    let finalDestination : String?  // b: des t: destSt
    
    init(rId:Int?, rtShortName:Int?, rtLN:String?, rtType:Int?, rtDirection:String?, final:String? ){
        self.routeId = rId
        self.routeShortName = rtShortName
        self.routeLongName  = rtLN
        self.routeType = rtType
        self.routeDirection = rtDirection
        self.finalDestination = final
    }
}
