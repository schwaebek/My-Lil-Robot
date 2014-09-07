//
//  RoboRoller.swift
//  
//
//  Created by Arthur Boia on 9/4/14.
//
//

import UIKit

class RoboRoller: RobotPart {
    
    var speed : Int = 0
    var rotation : Float = 0
    var brakes: Float = 0
    var tiltangle: Float = 0
    
    
   // var delegate:RoboRollerDelegate?
    
    override func addPartToRobotAtPoint(robot: UIView, point: CGPoint) {
        super.addPartToRobotAtPoint(robot, point: point)
    }
    
    func speedUp(speedIncrease: Int) -> Bool {
        
        let maxSpeed = 100
        
        speed += speedIncrease
        
        if speedIncrease == maxSpeed {
            [applyBrakes]
        }
        
    }
    
    func rotateRoller (rotationAmount: Float){
        rotation += rotationAmount
    }
    
    func applyBrakes () -> Bool {
      //  let maxSpeed; <= 100
        
    }
    
    func angle (tiltangle: Float) {
        
    }














}


}
