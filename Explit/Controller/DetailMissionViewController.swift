//
//  DetailMissionViewController.swift
//  Explit
//
//  Created by Maulana on 14/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class DetailMissionViewController: UIViewController {

    @IBOutlet weak var headerImageDetail: UIImageView!
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var typeDetail: UILabel!
    @IBOutlet weak var durationDetail: UILabel!
    @IBOutlet weak var levelDetail: UILabel!
    
    @IBOutlet weak var viewOverview: UIView!
    @IBOutlet weak var viewRequirements: UIView!
    @IBOutlet weak var viewTimeline: UIView!
    
    var nameMission = ""
    var headMission: UIImage = #imageLiteral(resourceName: "Mission2Thumbnail")
    var typeMission = ""
    var durationMission = ""
    var levelMission = ""
    var descMission = ""
    var listExploration: [String] = []
    var listConstraintMission: [String] = []
    var missionGoals = ""
    var listConstraint: [String] = []
    var iconMissionGoals: [String] = []
    var listTimeline: [Timeline] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerImageDetail.image = headMission
        nameDetail.text = nameMission
        typeDetail.text = typeMission
        durationDetail.text = "Duration " + durationMission
        levelDetail.text = levelMission
        
        print(iconMissionGoals)
        
        viewOverview.alpha = 1
        
    }
    
    @IBAction func segmentedDetails(_ sender: UISegmentedControl) {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is OverviewMissionViewController {
            if let overviewShow = segue.destination as? OverviewMissionViewController {
                overviewShow.descMissionFinal = descMission
                overviewShow.listExplorationFinal = listExploration
            }
        } else if segue.destination is TimelineMissionViewController {
            if let timelineShow = segue.destination as? TimelineMissionViewController {
                timelineShow.listTimelineFinal = listTimeline
            }
        } else if segue.destination is RequirementsMissionViewController {
            if let requirementsShow = segue.destination as? RequirementsMissionViewController {
                requirementsShow.listConstraintFinal = listConstraint
                requirementsShow.iconMissionGoalsFinal = iconMissionGoals
                requirementsShow.missionGoalsFinal = missionGoals
            }
        }
    }
    
}
