//
//  sbTrainHttpReqests.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/26/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation
class sbTrainHttpReqests {

    let Trainkey : String? = "25924988075841f2970d3e7f95c8070c"

    let baseUrlArivals : String?   =    "lapi.transitchicago.com/api/1.0/ttarrivals.aspx"
    let baseUrlLocations :String?  =    "api.transitchicago.com/api/1.0/ttpositions.aspx"
    let baseUrlFollowTrain:String? =    "http://lapi.transitchicago.com/api/1.0/ttfollow.aspx"
    let predictionsBaseUrl: String? =   "lapi.transitchicago.com/api/1.0/ttarrivals.aspx"
    var mid     : Int?      // map or stp reqired
    var sid     : Int?      // map or stp reqired
    var maxRt   : Int?      // optional
    var rts     : Int?      // optional


    // ------------Arivals API ---------------//
    //This API produces a list of arrival predictions for all platforms at a given train station in a well-formed XML document.
    // Registration and receipt of an API key is required for use of this API.
    // Requirments input
    //      base url
    //      mapID or stpID

    func arrivals (mapId:Int?, stpId:Int?, maxRet:Int?, rt:Int?) -> String? {
        if mapId == nil && stpId == nil { return nil } // one required
        
        if let url = baseUrlArivals, key = Trainkey {
            var http:String = "\(url)?key=\(key)"
            
            //get one of the mapid (pref) or stpID
            if let m = mapId { http += "&mapid=\(m)" }
            else{ if let s = stpId { http += "&stpid=\(s)" } }
            
            //fill in optional items if found
            if let m = maxRet  { http += "&smax=\(m)" }
            if let r = rt { http += "&rt=\(r)" }
            
            return http
        }
        return nil
        
        
    }

    // ------------Follow This Train API ---------------//

    //This API produces a list of arrival predictions for a given train at all subsequent stations for which that train is estimated to arrive, up to 20 minutes in the future or to the end of its trip.

    func followTrain(runNumber:Int?) -> String? {
        if (baseUrlFollowTrain == nil || Trainkey == nil || runNumber == nil) {return nil}
        return "\(baseUrlFollowTrain)?key=\(Trainkey)&runnumber=\(runNumber!)"
    }

    // ------------Locations API ---------------//
    // This API produces a list of in-service trains and basic info and their locations for one or more specified ‘L’ routes.

    func locations(rt:String?) -> String? {
        if (baseUrlLocations == nil || rt == nil || Trainkey == nil) { return nil }
        return "\(baseUrlLocations)?key=\(Trainkey)&rt=\(rt)"
        
    }
    
    func predictions (stpid:String?, rt:String?,vid:String?,top:String?) -> NSURL? {
       // if (stpid != nil && vid != nil) || (stpid == nil && vid == nil) || (stpid != nil && rt != nil) { return nil }
        if let tk = Trainkey, u = predictionsBaseUrl {
            var url = "\(u)?key=\(tk)"
            if let s = stpid { url = "\(url)&stpid=\(s)" }
            if let v = vid { url  = "\(url)&vid=\(v)" }
            if let r = rt { url  = "\(url)&rt=\(r)" }
            if let t = top { url = "\(url)&top=\(t)" }
            return NSURL(string:url)
        }
        return nil
    }
}