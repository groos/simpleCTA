//
//  mStops.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation

class Stop {
    init(){}
    
    var perdications : [Prediction]? = nil
    
    let stationID: String? = nil // t: staId b: stpid db: stop_id
    let stationName: String? = nil // B: stpnm t: staNm db: stop_Name or stop_desc
    
    let stopLatitude: Double? = nil // b: lat db: stop_lat
    let stopLongitude: Double? = nil // b: lon db: stop_lon
    let locationType: String? = nil // db: location_type
    
    // in here or rts?
    let finalDestination :  String? = nil // b: des t: destSt
    let platform: String? = nil // which way t:
    let routeDirection: String? = nil // B: rtdir // should be enum
    let distanceToUser: Double? = nil // calc of how close and need to setup a sort by
    

}
