//
//  userSettings.swift
//  SimpleCTA
//
//  Created by ntgroos on 6/5/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation


class userSettings: NSObject {
    
    // USE THIS VALUE (searchRadius) FOR DB RADIUS SEARCH
    // distance in latitude (not precise, can be improved later)
    var searchRadius: Double?
    var numberSearchResults: Int?
    
    var useMeters: Bool?
    
    // set to roughly the latitude value of a mile distance
    var searchRadiusMultiplier: Double?
    
    var searchRadiusMultiplierKM: Double?
    var searchRadiusMultiplierM: Double?
    
    override init(){
        self.numberSearchResults = 10
        self.searchRadiusMultiplier = 0.0144927
        self.searchRadiusMultiplierM = 0.0144927
        self.searchRadiusMultiplierKM = 0.008695
        self.searchRadius = 0.028985 // rough degree value for 2 miles, the starting radius.
        self.useMeters = false
    }
    
    // 0.0144927 = roughly a mile in latitude
    // Going to multiply that by the mile distance
    // requested by the user.
    func updateSearchRadius(distance: Double){
        self.searchRadius = distance * self.searchRadiusMultiplier!
    }
    
    func changeUnits(){
        if useMeters! {
            self.searchRadiusMultiplier = self.searchRadiusMultiplierKM
        } else {
            self.searchRadiusMultiplier = self.searchRadiusMultiplierM
        }
        
        useMeters = !useMeters!
    }
}