//
//  mPredictions.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation

class Prediction {
    init(){}
    
    // xml data in bus train
    let dataRequestedTime : NSDate? = nil  // b: tmstmp t: tmst
    let predictedArrivalTime : NSDate? = nil  // b: prdtm t: arrT
    let isApproaching: Bool? = nil  // t: isApp // train only
    let delayed: Bool? = nil //b: dly  t: isDly
    let livePrediction : Bool? = nil  // Train only : isSch  // tells if data is from gps or train schedule
    let predictionGenerated : NSDate? = nil /// train only: prdt
    let isArraival: Bool? = nil // b: typ // or Departure
    
    
    // not sure if to just send all data or do a get/set for buses and trains
    //busPerdictions(){}
    //trainPerdictions(){}
    
}