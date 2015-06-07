//
//  mPublicTransit.swift
//  SimpleCTA
//
//  Created by paul hawk on 6/4/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation

protocol PublicTransit {
    var title: String? { get }
    var style: String? { get }
    var routeId: String? { get }
    var stopId: String? {get}
}