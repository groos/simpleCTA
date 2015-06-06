//
//  vcPaulTest.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/26/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import UIKit



class vcPaulTest: UIViewController {
    
    @IBOutlet weak var searchRadiusSlider: UISlider!
    @IBOutlet weak var searchRadiusLabel: UILabel!
    @IBOutlet weak var searchRadius: UILabel!
    @IBOutlet weak var routesReturned: UILabel!
    @IBOutlet weak var routesReturnedStepper: UIStepper!
    
    @IBAction func updateSearchRadius(sender: UISlider) {
        searchRadius.text = sender.value.description
        Settings.updateSearchRadius(Double(sender.value))
    }

    @IBAction func updateSearchReturns(sender: UIStepper) {
        routesReturned.text = String(Int(sender.value))
        Settings.numberSearchResults = Int(sender.value)
    }
    
    @IBAction func switchUnits(sender: AnyObject) {
        
        Settings.changeUnits()
        
        if let setting = Settings.useMeters{
            
            if setting {
                searchRadiusLabel.text = "Search Radius (kilometers)"
            } else {
                searchRadiusLabel.text = "Search Radius (miles)"
            }
        }
    }
    
    
    @IBAction func printLocation(sender: UIButton) {
        GPS.getUserLocation()
        println("Location:")
        println(GPS.latitude)
        println(GPS.longitude)
        println()
        
        if let radius = Settings.searchRadius {
            println("Search Radius: " + radius.description)
        }
        if let results = Settings.numberSearchResults {
            println("Number of Search Results: " + results.description)
        }
        if let mode = Settings.useMeters {
            if mode {
                println("Running in Meters mode")
            } else {
                println("Running in US (standard) mode")
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        routesReturnedStepper.value = 10.0
        searchRadiusSlider.value = 2.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
