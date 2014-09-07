//
//  ViewController.swift
//  My Lil Robot
//
//  Created by Katlyn Schwaebe on 9/5/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        var robotBody = UIView(frame: CGRectMake(0, 0, 320, 480))
        var roller = RoboRoller()
        roller.addPartToRobotAtPoint(robotBody, point: CGPointMake(0, 480))
        
        var arcReactor = RobotArcReactor()
        arcReactor.addPartToRobotAtPoint(robotBody, point: CGPointMake(160, 240))
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

