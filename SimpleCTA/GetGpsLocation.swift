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
        self.latitude = 41.89632184
        self.longitude = -87.75410482
    }
    
    func getUserLocation() -> [String:Double]? {
        if let lat = self.latitude, long = self.longitude {
            return ["latitude" : lat,  "longitude" : long]
        } else {
            return nil
        }
        
    }
}