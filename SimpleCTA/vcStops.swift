//
//  vcStops.swift
//  SimpleCTA
//
//  Created by paul hawk on 6/3/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import UIKit

class vcStops: UIViewController , UITableViewDataSource, UITableViewDelegate{

    let simpleTableIdentifier = "SimpleTableIdentifier"
    private let routes : [Route]? = DB().dbtest()
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            if let c = routes?.count {
                return c
            }
            return 0
    }
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as? UITableViewCell
            if (cell == nil) {
                cell = UITableViewCell(
                    style: UITableViewCellStyle.Default,
                    reuseIdentifier: simpleTableIdentifier)
            }
            if let route = routes?[ indexPath.row ] {
                cell!.textLabel!.text = route.routeLongName
            } else {
                cell!.textLabel!.text = " fail "
            }
            return cell!
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if indexPath.row == 0 {
            return nil
        } else {
            return indexPath
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
