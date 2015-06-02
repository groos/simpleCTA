//
//  mPredictions.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation

class Prediction {
    
    // xml data in bus train
    let dataRequestedTime : NSDate?             // b: tmstmp t: tmst
    let predictedArrivalTime : Int?             // b: prdtm t: arrT
    let isApproaching: Bool?                    // t: isApp // train only
    let delayed: Bool?                          // b: dly  t: isDly
    let livePrediction : Bool?                  // t: isSch  Train only  // tells if data is from gps or train schedule
    let predictionGenerated : NSDate?           // t: prdt train only
    let isArraival: Bool?                       // b: typ // or Departure
    
    init(ts:NSDate?, pTime:Int?, isApp:Bool?, delay:Bool?, liveP:Bool?, predGen:NSDate?, isA:Bool?){
        self.dataRequestedTime = ts
        self.predictedArrivalTime = pTime
        self.isApproaching = isApp
        self.delayed = delay
        self.livePrediction = liveP
        self.predictionGenerated = predGen
        self.isArraival = isA 
    
    }
}