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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pulseView = WAActivityIndicatorView(frame: CGRect(x: 50, y: 80, width: 80, height: 80),
                indicatorType: ActivityIndicatorType.Pulse,
                tintColor: UIColor.blueColor(),
                indicatorSize: 80)
        pulseView.backgroundColor = UIColor.yellowColor()
        view.addSubview(pulseView)
        
        dotsView = WAActivityIndicatorView(frame: CGRect(x: 150, y: 80, width: 80, height: 80),
            indicatorType: ActivityIndicatorType.ThreeDotsScale,
            tintColor: UIColor.blueColor(),
            indicatorSize: 80)
        dotsView.backgroundColor = UIColor.yellowColor()
        view.addSubview(dotsView)
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        pulseView.startAnimating()
        dotsView.startAnimating()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

