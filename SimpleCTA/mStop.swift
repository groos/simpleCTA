//
//  mStops.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation

class Stop: PublicTransit {

    
    var perdications : [Prediction]? = nil
    
    let stationID: String?      // t: staId b: stpid db: stop_id
    let stationName: String?    // B: stpnm t: staNm db: stop_Name or stop_desc
    let routeLongName: String?
    let stopLatitude: Double?   // b: lat db: stop_lat
    let stopLongitude: Double?  // b: lon db: stop_lon
    let locationType: Int?      // db: location_type
    let cellStyle: String?
    let rId: String?
    
    let routeDirection: String?     // B: rtdir // should be enum
    let distanceToUser: Double?     // calc of how close and need to setup a sort by
    
    init(rId:String?, sId:String?, sName:String?, routeLongName:String?, lat:Double?,lon:Double?,rtDir:String?,distance:Double?, locType:Int?, style:String? ){
        self.rId = rId
        self.stationID = sId
        self.stationName = sName
        self.stopLatitude = lat
        self.stopLongitude = lon
        self.routeDirection = rtDir
        self.distanceToUser = distance
        self.locationType = locType
        self.routeLongName = routeLongName
        self.cellStyle = style
    }
    
    var stopId: String? {
        get { return self.stationID }
    }
    
    var routeId: String? {
        get { return self.rId }
    }
    var style: String? {
        get { return self.cellStyle }
    }
    var title: String? {
        get {
            if let st = self.stationName, sn = self.routeDirection {
               return "\(st) at \(sn)"
            }
            return "Error"
        }
    }
}
