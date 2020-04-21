//
//  SplashScreenViewController.swift
//  Explit
//
//  Created by Maulana on 08/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var indicatorLoading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let delay = 3
            self.indicatorLoading.startAnimating()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
                self.indicatorLoading.stopAnimating()
                self.indicatorLoading.isHidden = true
            }
        perform(#selector(showOnboarding), with: nil, afterDelay: 3)
                   print("Sukses")
        }
               
    @objc func showOnboarding() {
        performSegue(withIdentifier: Const.identifier.splashSegue, sender: self)
    }
}
