//
//  ViewController.swift
//  blurr
//
//  Created by 01HW612323 on 03/11/15.
//  Copyright © 2015 TCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inview: UIView!
    var activityI :ActivityIndicator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        activityI = ActivityIndicator(frame:CGRectZero)
        activityI.isModal = true
        activityI.configureModalBackGround(color: UIColor.yellowColor(), opacity: 0.5)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showIn(sender: UIButton) {
        activityI .showActivityIndicator(inView: inview)
    }

    @IBAction func stopIndicator(sender: UIButton) {
        activityI .stopActivityIndicator(fromView: inview)
    }
    
}

