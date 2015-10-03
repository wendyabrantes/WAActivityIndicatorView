//
//  ViewController.swift
//  WAActivityIndicatorViewExample
//
//  Created by Wendy Abrantes on 03/10/2015.
//  Copyright © 2015 ABRANTES DIGITAL LTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pulseView:WAActivityIndicatorView!
    var dotsView:WAActivityIndicatorView!
    var dotsTriangleView:WAActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let itemSize : CGFloat = 80.0
        
        self.view.backgroundColor = UIColor.lightGrayColor()
        
        pulseView = WAActivityIndicatorView(frame: CGRect(x: 50, y: itemSize, width: itemSize, height: itemSize),
                indicatorType: ActivityIndicatorType.Pulse,
                tintColor: UIColor.whiteColor(),
                indicatorSize: itemSize)

        view.addSubview(pulseView)
        
        dotsView = WAActivityIndicatorView(frame: CGRect(x: 150, y: itemSize, width: itemSize, height: itemSize),
            indicatorType: ActivityIndicatorType.ThreeDotsScale,
            tintColor: UIColor.whiteColor(),
            indicatorSize: itemSize)
        view.addSubview(dotsView)
        
        dotsTriangleView = WAActivityIndicatorView(frame: CGRect(x: 250, y: itemSize, width: itemSize, height: itemSize),
            indicatorType: ActivityIndicatorType.DotTriangle,
            tintColor: UIColor.whiteColor(),
            indicatorSize: itemSize)
        view.addSubview(dotsTriangleView)
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        pulseView.startAnimating()
        dotsView.startAnimating()
        dotsTriangleView.startAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

