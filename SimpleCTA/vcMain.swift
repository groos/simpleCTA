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
        cta.getRoutes()
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateRts()

        // Do any additional setup after loading the view.
       // vcnicktest = storyboard?.instantiateViewControllerWithIdentifier("Nick") as! vcNickTest
       // vcnicktest.view.frame = view.frame
       // switchViewController(from: nil, to: vcnicktest)
    }

    func populateRts(){
        //var dbParams: [String]?
        
//        for x in dbParameters {
//            if x.selected {
//                if let button = x.titleLabel?.text {
//                    dbParams?.append(button)
//                    println(button)
//                }
//            }
//        }

//            for x in dbParameters {
//                if let b = x as? UIButton{
//                    if b.selected {
//                        dbParams?.append(b.titleLabel?.text)
//                    }
//                }
//            }

        
        let rts = cta.getRoutes()
        if let r = rts {
            /// populate data
        }
        
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
    }
        if vcpaultest != nil && vcpaultest!.view.superview != nil {
            vcnicktest.view.frame = view.frame
            switchViewController(from: vcpaultest, to: vcnicktest)
        } else {
            vcpaultest.view.frame = view.frame
            switchViewController(from: vcnicktest, to: vcpaultest)
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
