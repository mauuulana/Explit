//
//  SeniorExplorersViewController.swift
//  Explit
//
//  Created by Maulana on 13/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class SeniorExplorersViewController: UIViewController {

    @IBOutlet weak var collectionSeniorListing: UICollectionView!
    @IBOutlet weak var searchBarSenior: UISearchBar!
    
    let explorerArray = ExplorerManager.sharedManager.allDataExplorerss()
    var filteredSenior = ExplorerManager.sharedManager.allDataExplorerss()
    var seniorExplorer = ExplorerManager.sharedManager.allDataExplorerss()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionSeniorListing.delegate = self
        collectionSeniorListing.dataSource = self
        searchBarSenior.delegate = self
        
        filteredSenior = explorerArray.filter({explorerArray -> Bool in explorerArray.grade == "Senior"})
        seniorExplorer = filteredSenior
    }
    
    func bestFrameSize() -> CGFloat {
        let frameHeight = self.view.frame.height
        let frameWidth = self.view.frame.width
        let bestFrameSize = (frameHeight > frameWidth ) ? frameHeight : frameWidth
                
        return bestFrameSize
    }
        
    @IBAction func segmentedFilteredSenior(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
           case 0:
               seniorExplorer = filteredSenior
           case 1:
               seniorExplorer = filteredSenior.filter({ filteredSenior -> Bool in
                filteredSenior.role == Const.explorers.facilitator.tech
               })
           case 2:
               seniorExplorer = filteredSenior.filter({ filteredSenior -> Bool in
                filteredSenior.role == Const.explorers.facilitator.design
               })
            case 3:
                seniorExplorer = filteredSenior.filter({ filteredSenior -> Bool in
                filteredSenior.role == Const.explorers.facilitator.professional
                })
           default:
               break
           }
           collectionSeniorListing.reloadData()
        }
}

extension SeniorExplorersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seniorExplorer.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellSeniorExplore = collectionSeniorListing.dequeueReusableCell(withReuseIdentifier: Const.identifier.exploreSenior, for: indexPath) as! SeniorCollectionViewCell
        
            let cellIndex = indexPath.item
            _ = bestFrameSize()

            cellSeniorExplore.seniorImageListing.image = UIImage.init(named: seniorExplorer[cellIndex].photo!)
            cellSeniorExplore.seniorNameLabel.text = seniorExplorer[cellIndex].name
            cellSeniorExplore.seniorDetailLabel.text = seniorExplorer[cellIndex].role! + " . " + seniorExplorer[cellIndex].shift!
            
            cellSeniorExplore.contentView.layer.masksToBounds = true

            cellSeniorExplore.layer.masksToBounds = false
            cellSeniorExplore.layer.shadowPath = UIBezierPath(roundedRect:cellSeniorExplore.bounds, cornerRadius:cellSeniorExplore.contentView.layer.cornerRadius).cgPath
            
            cellSeniorExplore.layer.shadowColor = UIColor.gray.cgColor
            cellSeniorExplore.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            cellSeniorExplore.layer.shadowRadius = 2.0
            cellSeniorExplore.layer.shadowOpacity = 0.4
            
            return cellSeniorExplore
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let showDetails = storyboard?.instantiateViewController(withIdentifier: Const.identifier.detailVC) as! DetailsExplorerViewController
        
        let cellIndexRow = indexPath.item
        
        showDetails.nicknameDetailsExplorer = seniorExplorer[cellIndexRow].nickname!
        showDetails.nameDetailsExplorer = seniorExplorer[cellIndexRow].name!
        showDetails.imageDetailsExplorer = seniorExplorer[cellIndexRow].photo!
        showDetails.gradeDetailsExplorer = seniorExplorer[cellIndexRow].grade!
        showDetails.roleDetailsExplorer = seniorExplorer[cellIndexRow].role!
        showDetails.shiftDetailsExplorer = seniorExplorer[cellIndexRow].shift!
        showDetails.canHelpDetailsExplorer = seniorExplorer[cellIndexRow].canHelp!
        showDetails.wantLearnDetailsExplorer = seniorExplorer[cellIndexRow].wantLearn!
        showDetails.contactDetailsExplorer = seniorExplorer[cellIndexRow].contact!
        
        self.present(showDetails, animated: true)
        
    }
}

extension SeniorExplorersViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 7, left: 4, bottom: 7, right: 4)
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
        return 10
    }
}

extension SeniorExplorersViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        seniorExplorer = filteredSenior.filter({ filteredSenior -> Bool in
            switch searchBar.selectedScopeButtonIndex {
            case 0:
                if searchText.isEmpty { return true }
                return filteredSenior.name!.lowercased().contains(searchText.lowercased())
            default:
                return false
            }
        })
        collectionSeniorListing.reloadData()
    }
}
