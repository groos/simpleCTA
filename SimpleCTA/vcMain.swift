//
//  vcMain.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/26/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

var dbParams = ["N": false, "S": false, "E" : false, "W": false, "Bus":false, "Train":false ]

import UIKit

class vcMain: UIViewController, UITableViewDataSource, UITableViewDelegate {
    ////// view's vars  /////////////
    private var vcnicktest:     vcNickTest!
    private var vcpaultest:     vcPaulTest!
    private var tvcstops:       vcStops!
    @IBOutlet var tableView:    UITableView!
    
    //////// buttons / views /////////////
    @IBOutlet var routeHeader: UIView!
    @IBOutlet var dbParameters: [UIButton]!
    @IBOutlet var routeImage:   UIImageView!
    @IBOutlet var routeLabel:   UILabel!
    @IBOutlet var stopImage:    UIImageView!
    @IBOutlet var stopLabel:    UILabel!
    
    /////////  table data source ///////////
    //var stop =
    private var transit : [PublicTransit]? = DB().dbtest()
    
    func reloadTable() {
        dispatch_async(dispatch_get_main_queue()) {
            self.tableView.reloadData()
        }
    }
    ///////////////////////////////////////////////////////////
    func handelInput (itemSelected : PublicTransit) {
        // route selected
        if cta.gotRoute == false {
            // handel the sign
            routeLabel.text = itemSelected.title
            routeImage.image = UIImage(named: "cellBlackBus")
            // set bools
            cta.gotRoute = true
            cta.route = itemSelected
            // reload data
            transit = DB().getStopsByRoute("the rt", andLocation: "the location")
            reloadTable()
        // stop selected
        } else {
                // handel the sign
                stopLabel.text = itemSelected.title
                stopImage.image = UIImage(named: "cellBlackBus")
                // set bools
                cta.gotStop = true


        }
    }
    func setup() {
        routeHeader.hidden = true
//        stopLabel.text = nil
//        stopImage.image = nil
//        routeLabel.text = nil
//        routeImage.image = nil
        
    }

    
    
    ///////// functions user actions /////////
    
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
    
    }
    
    @IBAction func goButtonPushed(sender: UIButton) {
        DB().DownloadDatabase()
    }
    
    ///////////////// table view /////////////////////
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 7
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
        }
        UIView.commitAnimations()
    }
    
    ///////////////// view methods ////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
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
