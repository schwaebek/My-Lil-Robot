//
//  ViewController.swift
//  DynamicsDemo
//
//  Created by Greg Heo on 2014-07-11.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
  var animator: UIDynamicAnimator!
  var gravity: UIGravityBehavior!
  var collision: UICollisionBehavior!

    var myRect1: UIView!
    var myRobotHead: UIView!
    var myEyeLeft: UIView!
    var myEyeRight: UIView!
    var myMouth: UIView!
    var snap: UISnapBehavior!
    var headSize: CGFloat = 100.0
    var myMouthSize: CGFloat = 25.0
    var myEyeSize: CGFloat = 10.0

  override func viewDidLoad() {
    super.viewDidLoad()

    
    
    myRect1 = UIView(frame: CGRect(x: 100, y: 100, width: headSize, height: headSize))
    myRect1.backgroundColor = UIColor.grayColor()
    myRect1.layer.cornerRadius = 5
    myRect1.multipleTouchEnabled = true
    
    view.addSubview(myRect1)
    
    myRobotHead = UIView(frame: CGRect(x: 50, y: 50, width: headSize, height: headSize * 1.25))
    myRobotHead.backgroundColor = UIColor.grayColor()
    myRobotHead.layer.cornerRadius = 5
    myRobotHead.multipleTouchEnabled = true
    
    view.addSubview(myRobotHead)
    
    myEyeLeft = UIView(frame: CGRect(x: (headSize * 0.25), y: headSize * 0.25, width: myEyeSize, height: myEyeSize))
    myEyeLeft.backgroundColor = UIColor.blackColor()
    myEyeLeft.layer.cornerRadius = myEyeSize / 2
    myRobotHead.addSubview(myEyeLeft)

    myEyeRight = UIView(frame: CGRect(x: (headSize * 0.75), y: headSize * 0.25, width: myEyeSize, height: myEyeSize))
    myEyeRight.backgroundColor = UIColor.blackColor()
    myEyeRight.layer.cornerRadius = myEyeSize / 2
    myRobotHead.addSubview(myEyeRight)
    
    myMouth = UIView(frame: CGRect(x: (headSize * 0.5), y: headSize * 0.75, width: myMouthSize, height: myMouthSize))
    myMouth.backgroundColor = UIColor.blackColor()
    myMouth.layer.cornerRadius = myMouthSize / 2
    myRobotHead.addSubview(myMouth)
    
    
    
    let hWall = UIView(frame: CGRect(x: 0, y: 300, width: 120, height: 20))
    hWall.backgroundColor = UIColor.redColor()
    view.addSubview(hWall)

    animator = UIDynamicAnimator(referenceView: view)
    gravity = UIGravityBehavior(items: [myRect1])
    animator.addBehavior(gravity)

    collision = UICollisionBehavior(items: [myRect1])
    
//    collision = UICollisionBehavior(items: [square, barrier])
    
    collision.collisionDelegate = self
    // add a boundary that has the same frame as the barrier
    collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: hWall.frame))
    collision.translatesReferenceBoundsIntoBoundary = true
    animator.addBehavior(collision)

    let itemBehaviour = UIDynamicItemBehavior(items: [myRect1])
    itemBehaviour.elasticity = 0.6
    animator.addBehavior(itemBehaviour)
  }

  func collisionBehavior(behavior: UICollisionBehavior!, beganContactForItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!, atPoint p: CGPoint) {
    println("Boundary contact occurred - \(identifier)")

    let collidingView = item as UIView
    
    self.growHead()
    self.growMouth()
    self.growEyes()
    
    collidingView.backgroundColor = UIColor.yellowColor()
    UIView.animateWithDuration(0.3) {
      collidingView.backgroundColor = UIColor.grayColor()
    }
  }

    func growHead() {
        headSize += 5.0
        if headSize > 500 {
            headSize = 100
        }
        myRobotHead.frame.size.height = headSize * 1.25
        myRobotHead.frame.size.width = headSize
      //  myRobotHead.layer.cornerRadius = headSize / 2
    }
    
    func growMouth() {  //(headSize * 0.5)
        myMouthSize += 2.5
        if myMouthSize > 75 {
            myMouthSize = 25
        }
        myMouth.frame.origin.x = (headSize * 0.5)
        myMouth.frame.origin.y = (headSize * 0.65)
        myMouth.frame.size.height = myMouthSize
        myMouth.frame.size.width = myMouthSize
        myMouth.layer.cornerRadius = myMouthSize / 2
    }
    
    func growEyes() {
        myEyeSize += 1.0
        if myEyeSize > 100 {
            myEyeSize = 10
        }
        
        myEyeLeft.frame.origin.x = (headSize * 0.25)
        myEyeLeft.frame.origin.y = (headSize * 0.25)
        myEyeLeft.frame.size.height = myEyeSize
        myEyeLeft.frame.size.width = myEyeSize
        myEyeLeft.layer.cornerRadius = myEyeSize / 2
        myEyeRight.frame.origin.x = (headSize * 0.75)
        myEyeRight.frame.origin.y = (headSize * 0.25)
        myEyeRight.frame.size.height = myEyeSize
        myEyeRight.frame.size.width = myEyeSize
        myEyeRight.layer.cornerRadius = myEyeSize / 2
    }
    
    
  override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
    if (snap != nil) {
      animator.removeBehavior(snap)
    }

    let touch = touches.anyObject() as UITouch
    snap = UISnapBehavior(item: myRect1, snapToPoint: touch.locationInView(view))
    animator.addBehavior(snap)
  }
}
