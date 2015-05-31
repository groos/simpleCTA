//
//  mCta.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation

class CTA {
    
    let userLocation : [String: Double]? = nil 
    var routes : [Route]? = nil // need to make weak
    
    init (){}
        /// get the user location here ? might be bad if user does not allow?
    
    
    func getRoutes () {
//        self.userLocation = UserGps().getUserLocation()
//        let sqlStatement: String? = DbQueryBuilder().GetRoutesByLocation(userLocation)
//        let routesQuery : String? = DB.getRoutesByLocation(sqlStatement)
//        parseDB.setRoutes(self, query)
//        displaydata()
    }
    
    func getStops (route:Route) {
//        self.userLocation = UserGps().getUserLocation()
//        let sqlStatement: String? = DbQueryBuilder().getStopsByRoute(Route)
//        let routesQuery : String? = DB.getRoutesByLocation(sqlStatement)
//        parseDB.setRoutes(self, query)
//        displaydata()
    }
    func getPerdictionsByStop (stop:Stop) {
//        url : String? = Stop.Bus ? sbBusHttpReqests().predictions() : sbTrainHttpReqests().predictions
//        xml : String? = getXml().getPerdictions()
//        parseXml(route)
//        displayData()
    }
    
}
