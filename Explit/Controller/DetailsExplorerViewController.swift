//
//  DetailExplorerViewController.swift
//  Explit
//
//  Created by Maulana on 13/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class DetailsExplorerViewController: UIViewController {

    @IBOutlet weak var imageDetails: UIImageView!
    @IBOutlet weak var nameDetails: UILabel!
    @IBOutlet weak var nicknameDetails: UILabel!
    @IBOutlet weak var gradeDetails: UILabel!
    @IBOutlet weak var roleDetails: UILabel!
    @IBOutlet weak var imageRoleDetails: UIImageView!
    @IBOutlet weak var shiftDetails: UILabel!
    @IBOutlet weak var imageShiftDetails: UIImageView!
    @IBOutlet weak var wantLearnDetails: UILabel!
    @IBOutlet weak var canHelpDetails: UILabel!
        
    var nameDetailsExplorer = ""
    var nicknameDetailsExplorer = ""
    var gradeDetailsExplorer = ""
    var shiftDetailsExplorer = ""
    var roleDetailsExplorer = ""
    var imageDetailsExplorer = ""
    var canHelpDetailsExplorer = ""
    var wantLearnDetailsExplorer = ""
    var contactDetailsExplorer = ""
    var roleIconDetailsExplorer = ""
    var shiftIconDetailsExplorer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageDetails.image = UIImage.init(named: imageDetailsExplorer)
        nameDetails.text = nameDetailsExplorer
        nicknameDetails.text = nicknameDetailsExplorer
        gradeDetails.text = gradeDetailsExplorer + " Explorer"
        roleDetails.text = roleDetailsExplorer
        shiftDetails.text = shiftDetailsExplorer + " " + Const.explorers.shift
        wantLearnDetails.text = wantLearnDetailsExplorer
        canHelpDetails.text = canHelpDetailsExplorer
        print(contactDetailsExplorer)
                
        switch roleDetailsExplorer {
            case Const.explorers.tech:
                imageRoleDetails.image = #imageLiteral(resourceName: "Xcode")
            case Const.explorers.facilitator.tech:
                imageRoleDetails.image = #imageLiteral(resourceName: "Xcode")
            case Const.explorers.design:
                imageRoleDetails.image = #imageLiteral(resourceName: "Sketch")
            case Const.explorers.facilitator.design:
                imageRoleDetails.image = #imageLiteral(resourceName: "Sketch")
            case Const.explorers.business:
                imageRoleDetails.image = #imageLiteral(resourceName: "Docs")
            case Const.explorers.facilitator.professional:
                imageRoleDetails.image = #imageLiteral(resourceName: "Docs")
            case Const.explorers.facilitator.am:
                imageRoleDetails.image = #imageLiteral(resourceName: "manager")
            default:
                print("Error")
                        
        }
                
        switch shiftDetailsExplorer {
            case "Afternoon":
                imageShiftDetails.image = #imageLiteral(resourceName: "Afternoon")
            case "Morning":
                imageShiftDetails.image = #imageLiteral(resourceName: "All")
            case "All":
                imageShiftDetails.image = #imageLiteral(resourceName: "All")
            default:
                print("Error")
        }
                            
    }

    @IBAction func contactExplorerPressed(_ sender: UIButton) {
        if let url = URL(string: contactDetailsExplorer) {
            UIApplication.shared.open(url)
        }
    }
}
