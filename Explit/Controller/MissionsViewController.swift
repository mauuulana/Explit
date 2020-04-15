//
//  MissionsViewController.swift
//  Explit
//
//  Created by Maulana on 14/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class MissionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToMissions (_ unwindSegue: UIStoryboardSegue) {
           let show = storyboard?.instantiateViewController(withIdentifier: "spaceExplorersMain") as! SpaceExplorersViewController
        
        self.present(show, animated: true)
    }
}
