
//
//  DotTriangleAnimation.swift
//  WAActivityIndicatorViewExample
//
//  Created by Wendy Abrantes on 03/10/2015.
//  Copyright © 2015 ABRANTES DIGITAL LTD. All rights reserved.
//

import UIKit

struct DotTriangleAnimation: WAActivityIndicatorProtocol {
    
    func setupAnimationInLayer(layer: CALayer, size: CGFloat, tintColor: UIColor) {
    
        let dotSize = size / 4
        let transformX = size - dotSize
        
        let dot = CAShapeLayer()
        dot.frame = CGRect(
            x: (size - dotSize) / 2,
            y: (size - dotSize) / 2,
            width:dotSize,
            height: dotSize)
        
        dot.path = UIBezierPath(ovalInRect: CGRect(x: 0, y:0, width: dotSize, height: dotSize)).CGPath
        dot.strokeColor = tintColor.CGColor
        dot.lineWidth = 1
        dot.fillColor = UIColor.clearColor().CGColor
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = CGRect(x: 0,y: 0,width: size,height: size)
        
        replicatorLayer.instanceDelay = 0.0
        replicatorLayer.instanceCount = 4
        
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, transformX, 0, 0.0)
        transform = CATransform3DRotate(transform, (CGFloat(120.0)*CGFloat(M_PI))/CGFloat(180.0), 0.0, 0.0, 1.0)
        replicatorLayer.instanceTransform = transform
        
        replicatorLayer.addSublayer(dot)
        layer.addSublayer(replicatorLayer)

        dot.addAnimation(rotationAnimation(transformX), forKey: "rotateAnimation")   
    }
    
    func rotationAnimation(transformX: CGFloat) -> CABasicAnimation{
        let rotateAnim = CABasicAnimation(keyPath: "transform")
        
        let t = CATransform3DIdentity
        let t2 = CATransform3DRotate(t, 0.0, 0.0, 0.0, 0.0)
        rotateAnim.fromValue = NSValue.init(CATransform3D: t2)
        var t3 = CATransform3DTranslate(t, transformX, 0.0, 0.0)
        t3 = CATransform3DRotate(t3, (CGFloat(120.0)*CGFloat(M_PI))/CGFloat(180.0), 0.0, 0.0, 1.0)
        rotateAnim.toValue = NSValue.init(CATransform3D: t3)
        rotateAnim.autoreverses = false
        rotateAnim.repeatCount = HUGE
        rotateAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        rotateAnim.duration = 1.0
        
        return rotateAnim
    }
}
