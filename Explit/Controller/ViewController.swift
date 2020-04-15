//
//  ViewController.swift
//  Explit
//
//  Created by Maulana on 14/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewOverview: UIView!
    @IBOutlet weak var viewTimeline: UIView!
    @IBOutlet weak var viewRequirements: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewOverview.alpha = 1
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func segmentPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewOverview.alpha = 1
            viewTimeline.alpha = 0
            viewRequirements.alpha = 0
        case 1:
            viewOverview.alpha = 0
            viewTimeline.alpha = 0
            viewRequirements.alpha = 1
        case 2:
            viewOverview.alpha = 0
            viewTimeline.alpha = 1
            viewRequirements.alpha = 0
        default:
            break
        }
        
    }
}
