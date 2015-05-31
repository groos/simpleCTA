//
//  vcRouteView.swift
//  SimpleCTA
//
//  Created by ntgroos on 5/29/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import UIKit

class RouteView: UITableViewController{
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1   //ROUTES_KEYS.count
//    }
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier(
                "Route", forIndexPath: indexPath)
                as! UITableViewCell
            
           // cell.textLabel?.text = ROUTES_KEYS[indexPath.row] as? String
            println("anyone home?")
            return cell
    }
    
    override func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath){
            let title = "A title is here"
            let message = "You clicked a Route!"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            let okayAction = UIAlertAction(title: "Okay", style: .Default, handler: nil)
            alertController.addAction(okayAction)
            presentViewController(alertController, animated: true, completion: nil)
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}