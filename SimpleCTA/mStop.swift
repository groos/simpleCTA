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
    
    let stationID: Int?      // t: staId b: stpid db: stop_id
    let stationName: String?    // B: stpnm t: staNm db: stop_Name or stop_desc
    let routeLongName: String?
    let stopLatitude: Double?   // b: lat db: stop_lat
    let stopLongitude: Double?  // b: lon db: stop_lon
    let locationType: Int?   // db: location_type
    let style: String?
    
    // in here or rts?
    //let finalDestination :  String?  // b: des t: destSt
    //let platform: String?           // which way t:
    let routeDirection: String?     // B: rtdir // should be enum
    let distanceToUser: Double?     // calc of how close and need to setup a sort by
    
    init(sId:Int?, sName:String?, routeLongName:String?, lat:Double?,lon:Double?,rtDir:String?,distance:Double?, locType:Int?, style:String? ){
        self.stationID = sId
        self.stationName = sName
        self.stopLatitude = lat
        self.stopLongitude = lon
        //self.finalDestination = dest
        //self.platform = plat
        self.routeDirection = rtDir
        self.distanceToUser = distance
        self.locationType = locType
        self.routeLongName = routeLongName
        self.style = style
    }
    
    var title: String {
        get {
            return "\(routeLongName) at \(stationName) .5 miles"
        }
    }
    

}
