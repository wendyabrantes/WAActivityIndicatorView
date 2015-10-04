//
//  PulseAnimation.swift
//  WAActivityIndicatorViewExample
//
//  Created by Wendy Abrantes on 03/10/2015.
//  Copyright © 2015 ABRANTES DIGITAL LTD. All rights reserved.
//
import UIKit

struct PulseAnimation: WAActivityIndicatorProtocol {
    
    func setupAnimationInLayer(layer: CALayer, size: CGFloat, tintColor: UIColor) {
        
        let pulse = CAShapeLayer()
        pulse.frame = CGRect(x: 0,y: 0,width: size,height: size)
        pulse.path = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: size, height: size)).CGPath
        pulse.fillColor = tintColor.CGColor
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = CGRect(x: 0,y: 0,width: size,height: size)
        
        //duration 3 sec
        //instance count = duration / delay to create infinite loop feel
        replicatorLayer.instanceDelay = 0.5
        replicatorLayer.instanceCount = 8
        replicatorLayer.addSublayer(pulse)
        //hide the original layer
        pulse.opacity = 0.0
        layer.addSublayer(replicatorLayer)
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [alphaAnimation(), scaleAnimation()]
        groupAnimation.duration = 4.0
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = HUGE
        
        pulse.addAnimation(groupAnimation, forKey: "groupAnimation")
        
    }
    
    func alphaAnimation() -> CABasicAnimation{
        let alphaAnim = CABasicAnimation(keyPath: "opacity")
        alphaAnim.fromValue = NSNumber(float: 1.0)
        alphaAnim.toValue = NSNumber(float: 0.0)
        
        return alphaAnim
    }
    func scaleAnimation() -> CABasicAnimation{
        let scaleAnim = CABasicAnimation(keyPath: "transform")
        
        let t = CATransform3DIdentity
        let t2 = CATransform3DScale(t, 0.0, 0.0, 0.0)
        scaleAnim.fromValue = NSValue.init(CATransform3D: t2)
        let t3 = CATransform3DScale(t, 1.0, 1.0, 0.0)
        scaleAnim.toValue = NSValue.init(CATransform3D: t3)
        
        return scaleAnim
    }
}

