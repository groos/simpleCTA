//
//  vcPaulTest.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/26/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import UIKit



class vcPaulTest: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let routes : [Route]? = DB().dbtest()

    let simpleTableIdentifier = "SimpleTableIdentifier"
    
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
    
    
    
    
    override func viewWillAppear(animated: Bool) {
                super.viewWillAppear(animated);
        
                // Do any additional setup after loading the view.
                
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
