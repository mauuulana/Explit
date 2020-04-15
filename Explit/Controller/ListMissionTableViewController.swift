//
//  ListMissionTableViewController.swift
//  Explit
//
//  Created by Maulana on 14/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ListMissionTableViewController: UITableViewController {
    
    @IBOutlet var listTableMission: UITableView!
    
    let listMission = MissionManager.init().arrayOfMission
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableMission.delegate = self
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMission.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "missionChallenge", for: indexPath) as! MissionsIndexTableViewCell

        let cellIndex = indexPath.item
        
        cell.imageMission.image = listMission[cellIndex].imageMission
        cell.nameMissionLabel.text = listMission[cellIndex].name
        cell.typeMissionLabel.text = listMission[cellIndex].type
        cell.detailMissionLabel.text = listMission[cellIndex].duration + " . " + listMission[cellIndex].level
        
        cell.cardViewTable.backgroundColor = #colorLiteral(red: 0.1206525043, green: 0.125664264, blue: 0.129843235, alpha: 1)
        
        cell.cardViewTable.layer.shadowColor = UIColor.gray.cgColor
        cell.cardViewTable.layer.shadowOffset = CGSize(width: 0, height: 0.7)
        cell.cardViewTable.layer.shadowRadius = 1.0
        cell.cardViewTable.layer.shadowOpacity = 0.4

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let showDetails = storyboard?.instantiateViewController(withIdentifier: "detailMission") as! DetailMissionViewController
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let showDetails = storyBoard.instantiateViewController(withIdentifier: "detailMission") as! DetailMissionViewController
        /*let overviewDetails = storyBoard.instantiateViewController(withIdentifier: "overviewMission") as! OverviewMissionViewController
        let requirementsDetails = storyBoard.instantiateViewController(withIdentifier: "requirementsMission") as! RequirementsMissionViewController
        let timelineDetails = storyBoard.instantiateViewController(withIdentifier: "timelineMission") as! TimelineMissionViewController*/
        
        
        let cellIndexRow = indexPath.item
        
        showDetails.nameMission = listMission[cellIndexRow].name
        showDetails.typeMission = listMission[cellIndexRow].type
        showDetails.durationMission = listMission[cellIndexRow].duration
        showDetails.levelMission = listMission[cellIndexRow].level
        showDetails.headMission = listMission[cellIndexRow].headerMission
        showDetails.descMission = listMission[cellIndexRow].description
        showDetails.listExploration = listMission[cellIndexRow].explorationGoals
        showDetails.listConstraint = listMission[cellIndexRow].constraints
        showDetails.missionGoals = listMission[cellIndexRow].missionGoals
        showDetails.listTimeline = listMission[cellIndexRow].timeline
        showDetails.iconMissionGoals = listMission[cellIndexRow].iconMissionGoals
        
        
        showDetails.modalPresentationStyle = .fullScreen
        self.present(showDetails, animated: true, completion: nil)
    }
    
}
