//
//  vcMain.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/26/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

var dbParams = ["N": false, "S": false, "E" : false, "W": false, "Bus":false, "Train":false ]

import UIKit

class vcMain: UIViewController {
    private var vcnicktest: vcNickTest!
    private var vcpaultest: vcPaulTest!
    private var tvcstops: vcStops!
    
    @IBOutlet var dbParameters: [UIButton]!
    
    @IBAction func dbParamsButtonPushed(sender: UIButton) {
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
        
        //DB().dbtest()
    }
    
    
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
    
}
