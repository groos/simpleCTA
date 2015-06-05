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

    //let simpleTableIdentifier = "SimpleTableIdentifier"
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if let c = routes?.count { return c }
            return 0
    }
    @IBAction func killButtonPressed(sender: UIButton) {
        busImage.image = nil
    }
    
    @IBOutlet var busImage: UIImageView!
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Red", forIndexPath: indexPath) as! UITableViewCell
        
        if let route = routes?[ indexPath.row ] {
            cell.textLabel!.text = route.routeLongName
        } else {
            cell.textLabel!.text = "Error"
        }
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
                super.viewWillAppear(animated);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
