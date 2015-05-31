////
////  parseXml.swift
////  SimpleCTA
////
////  Created by paul hawk on 5/30/15.
////  Copyright (c) 2015 Depaul University. All rights reserved.
////

import Foundation
class ParseXml {
    
    func getPerdictions (s:Stop){
        let p1 = Prediction(ts: nil, pTime: 5, isApp: false, delay: false, liveP: false, predGen: nil, isA: false)
        let p2 = Prediction(ts: nil, pTime: 10, isApp: false, delay: false, liveP: false, predGen: nil, isA: false)
        let p3 = Prediction(ts: nil, pTime: 15, isApp: false, delay: false, liveP: false, predGen: nil, isA: false)
        s.perdications?.append(p1)
        s.perdications?.append(p2)
        s.perdications?.append(p3)
       
    }
}
