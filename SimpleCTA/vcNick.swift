//
//  vcNickTest.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/26/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import UIKit

class vcNickTest: UIViewController, NSXMLParserDelegate {
    func gethtml () {
        let bushttp = sbBusHttpReqests().predictions(cta.stop?.stopId, rt: cta.route?.routeId, vid: nil, top: nil)
        let trainHttp = sbTrainHttpReqests().predictions(cta.stop?.stopId, rt: cta.route?.routeId, vid: nil, top: nil)
            print(bushttp)
            print(trainHttp)
        
        
    }

    @IBAction func parseXML(sender: UIButton) {
        parser.myParse()
        
        //if let route = ROUTES_KEYS[0] as? String{
            //parser.updateRouteDetails(route)
        //}
        
    }

    @IBAction func httpbuttonPruessed(sender: UIButton) {
        gethtml()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
