//
//  Missions.swift
//  Explit
//
//  Created by Maulana on 09/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

struct missions {
    let name: String
    let imageMission: UIImage
    let headerMission: UIImage
    let type: String
    let level: String
    let duration: String
    let description: String
    let explorationGoals: [String]
    let constraints: [String]
    let missionGoals: String
    let iconMissionGoals: [String]
    let timeline: [Timeline]
    
    init(name: String, imgMission: UIImage, header: UIImage, type: String, level: String, duration: String, description: String, exploration: [String], constraints: [String], goals: String, imgGoals: [String], timeline: [Timeline] ) {
        
        self.name = name
        self.imageMission = imgMission
        self.headerMission = header
        self.type = type
        self.level = level
        self.duration = duration
        self.description = description
        self.explorationGoals = exploration
        self.constraints = constraints
        self.missionGoals = goals
        self.iconMissionGoals = imgGoals
        self.timeline = timeline
    }
}

struct Timeline {
let date: String
let title: String
let descTimeline: String

init(date: String, title: String, desc: String) {
    self.date = date
    self.title = title
    self.descTimeline = desc
    }
}
