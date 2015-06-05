//
//  mRoutes.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation

class Route : PublicTransit {
   
    var stops:[Int : Stop]?
    let routeId: String?                // db: route_id t: rn
    let routeShortName: Int?        // db: route_short_name t: rt b: rt
    let routeLongName: String?
    let routeType : Int?            // db: route_type , ie bus / train
    let routeDirection: String?     // B: rtdir
    let finalDestination : String?  // b: des t: destSt
    let style : String?

    init( rId:String?, rtShortName:Int?, rtLN:String?, rtType:Int?, rtStyle:String?, rtDirection:String?, final:String? ){
        self.routeId = rId
        self.routeShortName = rtShortName
        self.routeLongName  = rtLN
        self.routeType = rtType
        self.routeDirection = rtDirection
        self.finalDestination = final
        self.style = rtStyle
    }
    
    var title : String {
        get {
            if let s = self.style, rln = self.routeLongName {
                if s  != "bus" {
                    return "\(rln)"
                }
                if let rid = self.routeId {
                    return "\(rid) : \(rln)"
                }
            }
            return "error"
        }
    }
    
        
    
  
    
}
