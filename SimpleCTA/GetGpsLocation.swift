//
//  gps.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation
import MapKit

class UserGps: NSObject {

    var latitude :      Double?  // need to make enums
    var longitude :     Double?
    var manager:        OneShotLocationManager?
    var mileRadius:     Double?
    var degreesRadius:  Double?

    override init(){
        self.latitude = 41.925222
        self.longitude = -87.653689
        self.mileRadius = 0.5
        manager = OneShotLocationManager()
    }

    
    func getUserLocation() -> [String:Double]? {
        
        // closure runs immediately
        manager?.fetchWithCompletion {location, error in
            if let loc = location {
                GPS.latitude = loc.coordinate.latitude
                GPS.longitude = loc.coordinate.longitude
                
   // REMOVE IF YOU WANT TO USE REAL LOCATION SERVICES.
                // ///////////////////////////////////
 // /*------*/    GPS.latitude = 41.925222
 // /*------*/    GPS.longitude = -87.653689
                /////////////////////////////////////
                
            } else if let err = error {
                println(err.localizedDescription)
            }
            // release the manager
            self.manager = nil
        }

        if let lat = self.latitude, long = self.longitude {
            return ["latitude" : lat,  "longitude" : long]
        } else {
            return nil
        }
    }
}