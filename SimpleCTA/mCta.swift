//
//  mCta.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

var cta = CTA()


import Foundation

class CTA {
    
    var userLocation : [String: Double]?
    var gotRoute : Bool?
    var gotStop : Bool?
    var route  : Route?
    var stop   : Stop?
    var predictions :  [Prediction]?
    
    init (){ }
        /// get the user location here ? might be bad if user does not allow?
    
//    // this is to get the routes for model and to use get to show on ui
//    func setRoutes () {
//        let sqlStatement : String?
//        let routesQuery : [String]?
//        
//        // 1. get user location
//        self.userLocation = UserGps().getUserLocation()
//        
//        // 2 get user location
//            // if let loc = userLocation {
//        sqlStatement = DbQueryBuilder().GetRoutesByLocation(userLocation!)
//            //}
//        
//        // 3. get the result from the db
//            //if let sql = sqlStatement {
//        routesQuery = DB().getStopsByRoute(sqlStatement)
//            //}
//        
//        // 4. fill model with results
//            // if let query = routesQuery {
//       // ParseDB().setRoutesByLocation()
//            //}
//    }
//    
//    // for sening to ui
//    func getRoutes() ->[String]? {
//        
//        // if routes == nil set it
//        if self.routes == nil { setRoutes() }
//        
//        // reutnr the routes
//        //if let r = self.routes?.values.array {
//            return ["dd"]//r
//        //} else {
//        //    return nil
//        //}
//    }
//    
//    // for getting the stops for model / show ui
//    func setStops() {
//        let sqlStatement: String?
//        let stopQuery : [String]? //Whatever the type is that the db returns
//        
//        // 1. try to get user location
//        self.userLocation = UserGps().getUserLocation()
//        
//        // 2. get sql statment
//            //if let u = self.userLocation, s = self.stop {
//        sqlStatement = DbQueryBuilder().getStopsByRouteUsing(Stop:"the stop" , AndLocation: userLocation!)
//            //}
//        
//        // 3. get the data from sql q
//            //if let sql = sqlStatement {
//        stopQuery = DB().getStopsByLocation(sqlStatement!)
//            //}
//        
//        // 4. put the data in model
//            //if let query = stopQuery {
//        ParseDB().setStops(self, data: stopQuery!)
//            //}
//    }
//    
//    // for showing on ui
//    func getStops () -> [String]? {
//        // if nil try to create it
//        if self.stops == nil { setStops() }
//        
//        // return the val
//                 return ["asdf"]
//  
//    }
//    
//    func setPerdictions() {
//        // skipping the first stops and just seting perdictions
//    
//        if let s = self.stop {
//            ParseXml().getPerdictions(s)
//        }
//    }
//    
//    func getPerdictionsByStop (stop:Stop) -> [Prediction]? {
//        if self.stops == nil {setPerdictions() }
//        
//        return self.predictions
    
            
    
}


