//
//  gps.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation

class UserGps {

    let latitude : Double?  // need to make enums
    let longitude : Double?

    init(){
        self.latitude = 41.925222
        self.longitude = -87.653689
    }
    
    func getUserLocation() -> [String:Double]? {
        if let lat = self.latitude, long = self.longitude {
            return ["latitude" : lat,  "longitude" : long]
        } else {
            return nil
        }
        
    }
}