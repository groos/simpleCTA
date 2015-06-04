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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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
        
//        if tableView == UpperTableView {
//            println("setting up cell for upper table view")
//            
//            let cell = tableView.dequeueReusableCellWithIdentifier("RouteCell", forIndexPath: indexPath) as! UITableViewCell
//            
//            // need to look up full route name in db
//            cell.textLabel?.text = ROUTES_KEYS[indexPath.row] as! String
//            
//            println(ROUTES_KEYS[indexPath.row] as! String)
//            return cell
//        }
        

        println("setting up cell for table view")
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailsCell", forIndexPath: indexPath) as! UITableViewCell
        
        if let detail = ACTIVE_ROUTE_DETAILS[indexPath.row] as? NSMutableDictionary{
            
            if let routeKey = detail.valueForKey("rt") as? String {
                cell.textLabel?.text = "Route Key: " + routeKey
            }
            
            if let arrivalTime = detail.valueForKey("arrT") as? String {
                cell.detailTextLabel?.text = "Arriving at: " + arrivalTime
            }
            
            
            //cell.textLabel?.text = "Route " + (detail.valueForKey("arrT") as? String)!
            //cell.detailTextLabel?.text = "Arriving at: " + (detail.valueForKey("arrT") as? String)!
        }
        
        return cell
        
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
