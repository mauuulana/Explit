//
//  RequirementsViewController.swift
//  Explit
//
//  Created by Maulana on 14/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RequirementsMissionViewController: UIViewController {

    @IBOutlet weak var listConstraints: UITableView!
    @IBOutlet weak var missionGoalsLabel: UILabel!
    @IBOutlet weak var collectionIconMission: UICollectionView!
    
    var listConstraintFinal: [String] = []
    var missionGoalsFinal = ""
    var iconMissionGoalsFinal: [String] = []
    
    override func viewWillAppear(_ animated: Bool) {

        missionGoalsLabel.text = missionGoalsFinal
        listConstraints.delegate = self
        listConstraints.dataSource = self
        collectionIconMission.delegate = self
        collectionIconMission.dataSource = self

    }
}

extension RequirementsMissionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listConstraintFinal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellConstraints = listConstraints.dequeueReusableCell(withIdentifier: "constraints", for: indexPath) as! ConstraintsTableViewCell
        
        let cellIndex = indexPath.item
        cellConstraints.constraintLabel.text = listConstraintFinal[cellIndex]
        
        return cellConstraints
    }
    
    
}

extension RequirementsMissionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconMissionGoalsFinal.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIconMissionGoals = collectionIconMission.dequeueReusableCell(withReuseIdentifier: "iconMissionGoals", for: indexPath) as! IconMissionGoalsCollectionViewCell
        
        let cellIndex = indexPath.item
        cellIconMissionGoals.iconMissionGoals.image = UIImage.init(named: iconMissionGoalsFinal[cellIndex])
        
        return cellIconMissionGoals
    }
}

extension RequirementsMissionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        let heightVal = self.view.frame.height
        let widthVal = self.view.frame.width
        let cellsize = (heightVal < widthVal) ?  bounds.height/2 : bounds.width/2
        
        return CGSize(width: cellsize - 10   , height:  cellsize - 10  )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


