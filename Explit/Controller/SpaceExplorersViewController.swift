//
//  SpaceExplorersViewController.swift
//  Explit
//
//  Created by Maulana on 12/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class SpaceExplorersViewController: UIViewController {
    
    @IBOutlet weak var collectionSenior: UICollectionView!
    @IBOutlet weak var collectionJunior: UICollectionView!
    
    let explorerArray = ExplorerManager.sharedManager.allDataExplorerss()
    var seniorArray = ExplorerManager.sharedManager.allDataExplorerss()
    var juniorArray = ExplorerManager.sharedManager.allDataExplorerss()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionJunior.delegate = self
        collectionJunior.dataSource = self
        collectionSenior.delegate = self
        collectionSenior.dataSource = self
       
        seniorArray = explorerArray.filter({explorerArray -> Bool in explorerArray.grade == "Senior"})
        let shuffledSenior = seniorArray.shuffled()
        seniorArray = shuffledSenior
        
        juniorArray = explorerArray.filter({explorerArray -> Bool in explorerArray.grade == "Junior"})
        let shuffledJunior = juniorArray.shuffled()
        juniorArray = shuffledJunior
        
    }
    
    func bestFrameSize() -> CGFloat {
            let frameHeight = self.view.frame.height
            let frameWidth = self.view.frame.width
            let bestFrameSize = (frameHeight > frameWidth ) ? frameHeight : frameWidth
            
            return bestFrameSize
    }
    
    @IBAction func unwindToExplorersMain (_ unwindSegue: UIStoryboardSegue) {
           let show = storyboard?.instantiateViewController(withIdentifier: "spaceExplorersMain") as! SpaceExplorersViewController
        
        self.present(show, animated: true)
    }
}

extension SpaceExplorersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellSenior = collectionSenior.dequeueReusableCell(withReuseIdentifier: "seniorMain", for: indexPath) as! SpaceExplorersSeniorCollectionViewCell
        
        if (collectionView == collectionJunior) {
            let cellJunior = collectionJunior.dequeueReusableCell(withReuseIdentifier: "juniorMain", for: indexPath) as! SpaceExplorersJuniorCollectionViewCell
            
            let cellIndex = indexPath.item
                       _ = bestFrameSize()
                       
            cellJunior.juniorImage.image = UIImage.init(named: juniorArray[cellIndex].photo!)
            cellJunior.juniorName.text = juniorArray[cellIndex].name
            cellJunior.juniorDetails.text = juniorArray[cellIndex].role! + " . " + juniorArray[cellIndex].shift!
            
            cellJunior.contentView.layer.masksToBounds = true
            cellJunior.layer.masksToBounds = false
            cellJunior.layer.shadowPath = UIBezierPath(roundedRect:cellJunior.bounds, cornerRadius:cellJunior.contentView.layer.cornerRadius).cgPath
            
            cellJunior.layer.shadowColor = UIColor.gray.cgColor
            cellJunior.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            cellJunior.layer.shadowRadius = 2.0
            cellJunior.layer.shadowOpacity = 0.4
            
            return cellJunior
        }
            let cellIndex = indexPath.item
            _ = bestFrameSize()

            cellSenior.seniorImage.image = UIImage.init(named: seniorArray[cellIndex].photo!)
            cellSenior.seniorName.text = seniorArray[cellIndex].name
            cellSenior.seniorDetails.text = seniorArray[cellIndex].role! + " . " + seniorArray[cellIndex].shift!
        
            cellSenior.contentView.layer.masksToBounds = true
            cellSenior.layer.masksToBounds = false
            cellSenior.layer.shadowPath = UIBezierPath(roundedRect:cellSenior.bounds, cornerRadius:cellSenior.contentView.layer.cornerRadius).cgPath
        
            cellSenior.layer.shadowColor = UIColor.gray.cgColor
            cellSenior.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            cellSenior.layer.shadowRadius = 2.0
            cellSenior.layer.shadowOpacity = 0.4
        
            return cellSenior
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let showDetails = storyboard?.instantiateViewController(withIdentifier: Const.identifier.detailVC) as! DetailsExplorerViewController
        let cellIndexRow = indexPath.item
        
        if (collectionView == collectionJunior) {
            showDetails.nicknameDetailsExplorer = juniorArray[cellIndexRow].nickname!
            showDetails.nameDetailsExplorer = juniorArray[cellIndexRow].name!
            showDetails.imageDetailsExplorer = juniorArray[cellIndexRow].photo!
            showDetails.gradeDetailsExplorer = juniorArray[cellIndexRow].grade!
            showDetails.roleDetailsExplorer = juniorArray[cellIndexRow].role!
            showDetails.shiftDetailsExplorer = juniorArray[cellIndexRow].shift!
            showDetails.canHelpDetailsExplorer = juniorArray[cellIndexRow].canHelp!
            showDetails.wantLearnDetailsExplorer = juniorArray[cellIndexRow].wantLearn!
            showDetails.contactDetailsExplorer = juniorArray[cellIndexRow].contact!

        } else {
            showDetails.nicknameDetailsExplorer = seniorArray[cellIndexRow].nickname!
            showDetails.nameDetailsExplorer = seniorArray[cellIndexRow].name!
            showDetails.imageDetailsExplorer = seniorArray[cellIndexRow].photo!
            showDetails.gradeDetailsExplorer = seniorArray[cellIndexRow].grade!
            showDetails.roleDetailsExplorer = seniorArray[cellIndexRow].role!
            showDetails.shiftDetailsExplorer = seniorArray[cellIndexRow].shift!
            showDetails.canHelpDetailsExplorer = seniorArray[cellIndexRow].canHelp!
            showDetails.wantLearnDetailsExplorer = seniorArray[cellIndexRow].wantLearn!
            showDetails.contactDetailsExplorer = seniorArray[cellIndexRow].contact!
        }
        
        self.present(showDetails, animated: true)
        
    }
}

extension SpaceExplorersViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 4, bottom: 8, right: 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        let heightVal = self.view.frame.height
        let widthVal = self.view.frame.width
        let cellsize = (heightVal < widthVal) ?  bounds.height/2 : bounds.width/2
        
        return CGSize(width: cellsize - 10   , height:  cellsize - 10  )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
}

