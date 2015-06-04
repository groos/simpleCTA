//
//  XMLTableViewController.swift
//  SimpleCTA
//
//  Created by ntgroos on 6/3/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import UIKit

class XMLTableViewController: UITableViewController {

    @IBOutlet weak var UpperTableView: UITableView!
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == UpperTableView {
            println("upper found")
            return ACTIVE_ROUTE_DETAILS.count
        }
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailsCell", forIndexPath: indexPath) as! UITableViewCell

        if let detail = ACTIVE_ROUTE_DETAILS[indexPath.row] as? NSMutableDictionary {
                cell.textLabel?.text =  DB().getRouteLongName(routeKey: detail.valueForKey("rt") as? String)
            if let arrivalTime = detail.valueForKey("arrT") as? String, destination = detail.valueForKey("destNm") as? String {
                cell.detailTextLabel?.text = "Heading Towards " + destination +  "\nArriving at: " + arrivalTime
            }
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
