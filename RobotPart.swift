//
//  RobotPart.swift
//  My Lil Robot
//
//  Created by Katlyn Schwaebe on 9/5/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

import UIKit

class RobotPart: UIView {
    
    func addPartToRobotAtPoint(robot:UIView, point: CGPoint) {
        robot.addSubview(self)
        self.center = point
    }
   
}
