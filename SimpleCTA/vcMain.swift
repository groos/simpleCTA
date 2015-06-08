//
//  vcMain.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/26/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

var dbParams = ["N": false, "S": false, "E" : false, "W": false, "Bus":false, "Train":false ]
var GPS = UserGps()
var Settings = userSettings()

import UIKit

class vcMain: UIViewController, UITableViewDataSource, UITableViewDelegate {
    ////// view's vars  /////////////
    private var vcnicktest:     vcNickTest!
    private var vcpaultest:     vcPaulTest!
    private var tvcstops:       vcStops!
    @IBOutlet var tableView:    UITableView!
    
    //////// buttons / views /////////////
    @IBOutlet var dbParameters: [UIButton]!
    
    /////////  table data source ///////////
    private var transit : [PublicTransit]? = DB().getRoutesByLocation()
    
//    @IBAction func goButtonPressed(sender: UIBarButtonItem) {
//        if cta.gotRoute == false {
//            transit = DB().getRoutesByLocation()
//        } else {
//            transit = DB().getStopsByRoute(cta.route?.routeId!)
//        }
//        reloadTable()
//    }


    ///////////////////////////////////////////////////////////

    
    func gethtml () {
        let bushttp = sbBusHttpReqests().predictions(cta.stop?.stopId, rt: cta.route?.routeId, vid: nil, top: nil)
        let trainHttp = sbTrainHttpReqests().predictions(cta.stop?.stopId, rt: cta.route?.routeId, vid: nil, top: nil)
        //print(bushttp)
    }

//    @IBAction func refreshButtonClicked(sender: UIBarButtonItem) {
//        cta.gotRoute = false
//        cta.gotStop = false
//        cta.route = nil
//        cta.stop = nil
//        DB().getRoutesByLocation()
//        
//        self.tableView.reloadData()
//        
//        var k = dbParams.keys        
//        for key in k {
//            dbParams[key] = false
//        }
//        
//        gethtml()
//    }

    
    @IBAction func downloadDb(sender: UIBarButtonItem) {
        DB().DownloadDatabase()
    }
    
    //////////////////////////////////////////////////
    /////////// deal with reloading / loading of data
    //////////////////////////////////////////////

    @IBAction func dbParametersButtonPressed(sender: UIButton) {
        
        if sender.selected {
            sender.alpha = 1
            sender.selected = !sender.selected
        } else {
            sender.alpha = 0.50
            sender.selected = !sender.selected
        }
        if let text = sender.titleLabel!.text {
            if let bool = dbParams[text] {
                dbParams[text] = !bool
                println(dbParams[text])
            }
        }
            self.reloadTable("Route")
    
    }
    
    
    @IBAction func refreshButtonPressed(sender: AnyObject)  {
        
        /// set values
        dbParams = ["N": false, "S": false, "E" : false, "W": false, "Bus":false, "Train":false ]
        cta.route = nil
        cta.stop = nil
        cta.gotRoute = false
        cta.gotStop = false
        
        // call reload table
        self.reloadTable("Route")
        
    }
    
    func handelInput (itemSelected : PublicTransit)  {
        var getWhat : String? = nil
        // route selected
        if cta.gotRoute == false {
            // set bools
            cta.gotRoute = true
            cta.route = itemSelected
            getWhat = "Route"
        } else {
            cta.stop = itemSelected
            cta.gotStop = true
            getWhat = "Stop"
        }
        self.reloadTable(getWhat)
        
    }
    
    func getData (getWhat:String?) {
        if let what = getWhat {
            switch(what) {
                case "Route":
                    self.transit = DB().getRoutesByLocation()
                    break
                case "Stop":
                    transit = DB().getStopsByRoute(cta.route?.routeId)
                    break
                default :
                    self.transit = DB().getRoutesByLocation()
                    break
            }
        }
        
    }
    
    func reloadTable(getWhat:String?) {
        dispatch_async(dispatch_get_main_queue()) {
            self.getData(getWhat)
            self.tableView.reloadData()
        }
    }
    
    
    ///////////////// table view /////////////////////
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let c = transit?.count { return c }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let r = transit![row]
        let cell = tableView.dequeueReusableCellWithIdentifier(r.style!, forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = r.title
        
        return cell
    }

    /////////////////////////////////
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        if let r = transit {
            println(r[row].title)
           handelInput(r[row])
        }
    }
    //////////////////////////////////
    
    
    
    
    ///////////// segues /////////////////
    @IBAction func switchViews(sender: UIBarButtonItem) {
        if vcpaultest?.view.superview == nil {
            if vcpaultest == nil {
                vcpaultest = storyboard?.instantiateViewControllerWithIdentifier("Paul") as! vcPaulTest
            }
        } else if vcnicktest?.view.superview == nil {
            if vcnicktest == nil {
                vcnicktest = storyboard?.instantiateViewControllerWithIdentifier("Nick") as! vcNickTest
            }
        } else if tvcstops?.view.superview == nil {
            if tvcstops == nil {
                tvcstops = storyboard?.instantiateViewControllerWithIdentifier("Stops") as! vcStops
            }
            
            if vcpaultest != nil && vcpaultest!.view.superview != nil {
                vcnicktest.view.frame = view.frame
                switchViewController(from: vcpaultest, to: vcnicktest)
            } else if (vcnicktest != nil && vcpaultest!.view.superview != nil){
                vcpaultest.view.frame = view.frame
                switchViewController(from: vcnicktest, to: vcpaultest)
            } else  {
                vcpaultest.view.frame = view.frame
                switchViewController(from: vcpaultest, to: tvcstops)
            }
        }
    }
    
    private func switchViewController(from fromVC:UIViewController?, to toVC:UIViewController?) {
        if fromVC != nil {
            fromVC!.willMoveToParentViewController(nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        if toVC != nil {
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, atIndex: 0)
            toVC!.didMoveToParentViewController(self)
        }
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        
        // Switch view controllers
        if vcpaultest != nil && vcpaultest!.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            vcnicktest.view.frame = view.frame
            switchViewController(from: vcpaultest, to: vcnicktest)
        } else {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            vcpaultest.view.frame = view.frame
            switchViewController(from: vcnicktest, to: vcpaultest)
        let a = cta.route as! Route
            a.routeType
        }
        UIView.commitAnimations()
    }
    
    ///////////////// view methods ////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
        if vcpaultest != nil
            && vcpaultest!.view.superview == nil {
            vcpaultest = nil
        }
        if vcnicktest != nil
            && vcnicktest!.view.superview == nil {
            vcnicktest = nil
        }
    }
}
