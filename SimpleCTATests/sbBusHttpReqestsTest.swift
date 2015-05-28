//
//  sbBusHttpReqestsTest.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/26/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import UIKit
import XCTest

class sbBusHttpReqestsTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTime() {
        let time = sbBusHttpReqests()
        XCTAssertTrue("http://www.ctabustracker.com/bustime/api/v1/gettime?key=E3bHdi46tLzpWHgXH9GY5kQF8" == time.busTime())
    }
}


//// vehicles -- get individal buses by rt or vid but not both
//// rt
//if let v = vehicles(nil, "80,8"){
//    print(v)
//}
//// vid
//if let v = vehicles("7916,1101", nil){
//    print(v)
//}
//// both nill -> nil
//if let v = vehicles(nil, nil){
//    print(v)
//}
////both != nill -> nii
//if let v = vehicles("7916,1101","80,8"){
//    print(v)
//}
//
//// routes -- gets all the routes
//// no input -> just one
//if let r = routes() {
//    print(r)
//}
//
//// routesDirection -- gets the direction strings for the rts
//// should be put in the db?
//if let rd = routesDirection("80") {
//    print(rd)
//}
//// no input return nil
//if let rd = routesDirection(nil) {
//    print(rd)
//}
//
//// stops gets the stops for a rt and direction both or one nil -> nil
//if let s = stops("80" , "Westbound"){
//    print(s)
//}
//if let s = stops("80" , nil){
//    print(s)
//}
//if let s = stops(nil, "Westbound"){
//    print(s)
//}
//if let s = stops(nil  , nil){
//    print(s)
//}
//
//// patterns - request to retrieve the set of geo-positional points and stops that when connected
////   can be used to construct the geo-positional layout of a pattern (i.e., route variation).
//// patterns (pid, rt)
//if let p = patterns(nil ,"80") {
//    print(p)
//}
//if let p = patterns("3087", nil) {
//    print(p)
//}
//if let p = patterns("3087" ,"80") {
//    print(p)
//}
//if let p = patterns(nil ,nil) {
//    print(p)
//}
//
//// Predictions - times of busses by
//// vid or stpid required but not both
//// rt only with vid - optional
//// top - optional
//
//// should return url
//if let p = predictions("15930", nil, nil, nil){
//    print(p)
//}
//if let p = predictions("15930", nil, nil, "10"){
//    print(p)
//}
//if let p = predictions(nil, nil, "1101", nil){
//    print(p)
//}
//if let p = predictions(nil, "80", "1101", nil){
//    print(p)
//}
//if let p = predictions(nil, "80", "1101", "10"){
//    print(p)
//}
//
//// should return nil
//if let p = predictions(nil, nil, nil, nil){
//    print(p)
//}
//if let p = predictions("15930", "80", nil, nil){
//    print(p)
//}
//if let p = predictions("15930", "80", nil, "10"){
//    print(p)
//}
//if let p = predictions("15930", nil, "1101", nil){
//    print(p)
//}
//if let p = predictions("15930", nil, "1101", "10"){
//    print(p)
//}
//if let p = predictions(nil, "80", nil, nil){
//    print(p)
//}
//if let p = predictions(nil, "80", nil, "10"){
//    print(p)
//}
//
//// serviceBulletins - list of service bulletins that are in effect for a route(s) (rt), route &
////    direction (rt & rtdir), route & direction & stop (rt & rtdir & stpid), or stop(s) (stpid).
//
//// rt or stpid required but not both
//// rtdir - optional
//// func predictions (stpid:String?, rt:String?,vid:String?,top:String?) -> String? {
//// should return url
//if let sb = serviceBulletins("80", nil, nil){
//    print(sb)
//}
//if let sb = serviceBulletins("80", "Westbound", nil){
//        print(sb)
//}
//if let sb = serviceBulletins(nil, nil, "15930"){
//            print(sb)
//}
//if let sb = serviceBulletins(nil, "Westbound", "15930"){
//                print(sb)
//}
//
//// should return nil
//if let sb = serviceBulletins(nil, nil, nil){
//    print(sb)
//}
//if let sb = serviceBulletins("80", nil, "15930"){
//        print(sb)
//}
//if let sb = serviceBulletins("80", "Westbound", "15930"){
//            print(sb)
//}
//
//
//if let p = predictions("1,2,3,4,5,6,7,8", nil, nil, nil){
//    print(p)
//}