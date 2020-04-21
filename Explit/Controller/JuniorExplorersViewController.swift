//
//  JuniorExplorersViewController.swift
//  Explit
//
//  Created by Maulana on 12/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class JuniorExplorersViewController: UIViewController {

    @IBOutlet weak var collectionJuniorListing: UICollectionView!
    @IBOutlet weak var searchJuniorName: UISearchBar!
    
    let explorerArray = ExplorerManager.sharedManager.allDataExplorerss()
    var filteredJunior = ExplorerManager.sharedManager.allDataExplorerss()
    var juniorExplorer = ExplorerManager.sharedManager.allDataExplorerss()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionJuniorListing.delegate = self
        collectionJuniorListing.dataSource = self
        searchJuniorName.delegate = self
        
        filteredJunior =  explorerArray.filter({explorerArray -> Bool in explorerArray.grade == "Junior" })
        
        juniorExplorer = filteredJunior
    }
    
    func bestFrameSize() -> CGFloat {
        let frameHeight = self.view.frame.height
        let frameWidth = self.view.frame.width
        let bestFrameSize = (frameHeight > frameWidth ) ? frameHeight : frameWidth
                
        return bestFrameSize
    }
        
    @IBAction func segmentedFilteredJunior(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
           case 0:
               juniorExplorer = filteredJunior
           case 1:
               juniorExplorer = filteredJunior.filter({ filteredJunior -> Bool in
                filteredJunior.role == "Tech"
               })
           case 2:
               juniorExplorer = filteredJunior.filter({ filteredJunior -> Bool in
                filteredJunior.role == "Design"
               })
            case 3:
                juniorExplorer = filteredJunior.filter({ filteredJunior -> Bool in
                 filteredJunior.role == "Business"
                })
           default:
               break
           }
           collectionJuniorListing.reloadData()
        }
}

    extension JuniorExplorersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return juniorExplorer.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cellJuniorExplore = collectionJuniorListing.dequeueReusableCell(withReuseIdentifier: Const.identifier.exploreJunior, for: indexPath) as! JuniorCollectionViewCell
        
            let cellIndex = indexPath.item
            _ = bestFrameSize()

            cellJuniorExplore.juniorImagesListing.image = UIImage.init(named: juniorExplorer[cellIndex].photo!)
            cellJuniorExplore.juniorNameListing.text = juniorExplorer[cellIndex].name
            cellJuniorExplore.juniorDetailListing.text = juniorExplorer[cellIndex].role! + " . " + juniorExplorer[cellIndex].shift!
            
            cellJuniorExplore.contentView.layer.masksToBounds = true

            cellJuniorExplore.layer.masksToBounds = false
            cellJuniorExplore.layer.shadowPath = UIBezierPath(roundedRect:cellJuniorExplore.bounds, cornerRadius:cellJuniorExplore.contentView.layer.cornerRadius).cgPath
            
            cellJuniorExplore.layer.shadowColor = UIColor.gray.cgColor
            cellJuniorExplore.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            cellJuniorExplore.layer.shadowRadius = 2.0
            cellJuniorExplore.layer.shadowOpacity = 0.4
            
            return cellJuniorExplore
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let showDetails = storyboard?.instantiateViewController(withIdentifier: Const.identifier.detailVC) as! DetailsExplorerViewController
            
            let cellIndexRow = indexPath.item
            
            showDetails.nicknameDetailsExplorer = juniorExplorer[cellIndexRow].nickname!
            showDetails.nameDetailsExplorer = juniorExplorer[cellIndexRow].name!
            showDetails.imageDetailsExplorer = juniorExplorer[cellIndexRow].photo!
            showDetails.gradeDetailsExplorer = juniorExplorer[cellIndexRow].grade!
            showDetails.roleDetailsExplorer = juniorExplorer[cellIndexRow].role!
            showDetails.shiftDetailsExplorer = juniorExplorer[cellIndexRow].shift!
            showDetails.canHelpDetailsExplorer = juniorExplorer[cellIndexRow].canHelp!
            showDetails.wantLearnDetailsExplorer = juniorExplorer[cellIndexRow].wantLearn!
            showDetails.contactDetailsExplorer = juniorExplorer[cellIndexRow].contact!
            
            self.present(showDetails, animated: true)
            
        }
        
    }

    extension JuniorExplorersViewController : UICollectionViewDelegateFlowLayout {
        
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

    extension JuniorExplorersViewController: UISearchBarDelegate {
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            juniorExplorer = filteredJunior.filter({ filteredJunior -> Bool in
                switch searchBar.selectedScopeButtonIndex {
                case 0:
                    if searchText.isEmpty { return true }
                    return filteredJunior.name!.lowercased().contains(searchText.lowercased())
                default:
                    return false
                }
            })
            collectionJuniorListing.reloadData()
        }
    }

