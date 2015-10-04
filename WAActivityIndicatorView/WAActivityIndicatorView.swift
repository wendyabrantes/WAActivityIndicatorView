//
//  WAActivityIndicatorView.swift
//  WAActivityIndicatorViewExample
//
//  Created by Wendy Abrantes on 03/10/2015.
//  Copyright © 2015 ABRANTES DIGITAL LTD. All rights reserved.
//

import UIKit

protocol WAActivityIndicatorProtocol {
    func setupAnimationInLayer(layer: CALayer, size: CGFloat, tintColor: UIColor);
}

enum ActivityIndicatorType{
    case Pulse
    case ThreeDotsScale
    case DotTriangle
    case GridDots
    
    func animation() -> WAActivityIndicatorProtocol {
        switch self {
        case .Pulse:
            return PulseAnimation();
        case .ThreeDotsScale:
            return ThreeDotsScaleAnimation();
        case .DotTriangle:
            return DotTriangleAnimation();
        case .GridDots:
            return GridDotsAnimation();
        }
    }
}

class WAActivityIndicatorView: UIView {
    
    var indicatorType: ActivityIndicatorType;
    private var indicatorSize : CGFloat = 40.0
    private var _tintColor = UIColor.whiteColor()
    private var _isAnimating = false;
    
    
    init(frame: CGRect, indicatorType : ActivityIndicatorType, tintColor: UIColor, indicatorSize: CGFloat) {

        self.indicatorType = indicatorType
        self.indicatorSize = indicatorSize
        _tintColor = tintColor
        
        super.init(frame: frame)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setupAnimation(){
        
        layer.sublayers = nil
        let animation : WAActivityIndicatorProtocol = indicatorType.animation()
        animation.setupAnimationInLayer(layer, size: indicatorSize, tintColor: _tintColor)
        layer.speed = 0.0

    }

    func startAnimating(){
        if layer.sublayers == nil {
            setupAnimation()
        }
        layer.speed = 1.0
        _isAnimating = true
    }
    
    func stopAnimating(){
        layer.speed = 0.0
        _isAnimating = false
    }
    
}





