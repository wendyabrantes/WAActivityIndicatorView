//
//  ThreeDotsScaleAnimation.swift
//  WAActivityIndicatorViewExample
//
//  Created by Wendy Abrantes on 03/10/2015.
//  Copyright © 2015 ABRANTES DIGITAL LTD. All rights reserved.
//

import UIKit

struct ThreeDotsScaleAnimation: WAActivityIndicatorProtocol {
    
    func setupAnimationInLayer(layer: CALayer, size: CGFloat, tintColor: UIColor) {
        
        let marginBetweenDot: CGFloat = 5.0
        let dotSize = (size - 2*marginBetweenDot) / 3
        
        let dot = CAShapeLayer()
        dot.frame = CGRect(
            x: 0,
            y: (size - dotSize)/2,
            width:dotSize,
            height: dotSize)
        
        dot.path = UIBezierPath(ovalInRect: CGRect(x: 0, y:0, width: dotSize, height: dotSize)).CGPath
        dot.fillColor = tintColor.CGColor
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = CGRect(x: 0,y: 0,width: size, height: size)
        
        replicatorLayer.instanceDelay = 0.2
        replicatorLayer.instanceCount = 3
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(marginBetweenDot+dotSize, 0, 0)
        
        replicatorLayer.addSublayer(dot)
        layer.addSublayer(replicatorLayer)
        dot.addAnimation(scaleAnimation(), forKey: "scaleAnimation")
        
    }
    
    func scaleAnimation() -> CABasicAnimation{
        let scaleAnim = CABasicAnimation(keyPath: "transform")
        
        let t = CATransform3DIdentity
        let t2 = CATransform3DScale(t, 1.0, 1.0, 0.0)
        scaleAnim.fromValue = NSValue.init(CATransform3D: t2)
        let t3 = CATransform3DScale(t, 0.2, 0.2, 0.0)
        scaleAnim.toValue = NSValue.init(CATransform3D: t3)
        scaleAnim.autoreverses = true
        scaleAnim.repeatCount = HUGE
        scaleAnim.duration = 0.3
        
        return scaleAnim
    }
}
