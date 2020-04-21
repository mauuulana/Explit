//
//  MissionsManager.swift
//  Explit
//
//  Created by Maulana on 13/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

class MissionManager {
    
    class TimelineMissions {
        var mission1: [Timeline] = []
        var mission2: [Timeline] = []
        var tba: [Timeline] = []
        init () {
            mission1 = [
                Timeline(date: Const.timeline.mission1.date.time1, title: Const.timeline.mission1.title.title1, desc: Const.timeline.mission1.description.desc1),
                Timeline(date: Const.timeline.mission1.date.time2, title: Const.timeline.mission1.title.title2, desc: Const.timeline.mission1.description.desc2),
                Timeline(date: Const.timeline.mission1.date.time3, title: Const.timeline.mission1.title.title3, desc: Const.timeline.mission1.description.desc3),
                Timeline(date: Const.timeline.mission1.date.time4, title: Const.timeline.mission1.title.title4, desc: Const.timeline.mission1.description.desc4),
                Timeline(date: Const.timeline.mission1.date.time5, title: Const.timeline.mission1.title.title5, desc: Const.timeline.mission1.description.desc5),
                Timeline(date: Const.timeline.mission1.date.time6, title: Const.timeline.mission1.title.title6, desc: Const.timeline.mission1.description.desc6)
            ]
            
            mission2 = [
                Timeline(date: Const.timeline.mission2.date.time1, title: Const.timeline.mission2.title.title1, desc: Const.timeline.mission2.description.desc1),
                Timeline(date: Const.timeline.mission2.date.time2, title: Const.timeline.mission2.title.title2, desc: Const.timeline.mission2.description.desc2),
                Timeline(date: Const.timeline.mission2.date.time3, title: Const.timeline.mission2.title.title3, desc: Const.timeline.mission2.description.desc3)
            ]
            tba = [
                Timeline.init(date: "Soon", title: Const.caption.tba, desc: "-")
            ]
        }
    }
    
    var arrayOfMission: [missions]
    init() {
        arrayOfMission = [
            missions.init(name: Const.mission.name.m1, imgMission: Const.mission.imgMission.img1, header: Const.mission.header.header1, type: Const.mission.type.group, level: Const.mission.level.mini, duration: Const.mission.duration.w5, description: Const.mission.description.desc1, exploration: Const.mission.explorationGoals.goals1, constraints: Const.mission.constraints.c1, goals: Const.mission.goals.g1, imgGoals: Const.mission.iconGoals.mission1, timeline: MissionManager.TimelineMissions.init().mission1),
            missions.init(name: Const.mission.name.m2, imgMission: Const.mission.imgMission.img2, header: Const.mission.header.header2, type: Const.mission.type.individu, level: Const.mission.level.nano, duration: Const.mission.duration.w2, description: Const.mission.description.desc2, exploration: Const.mission.explorationGoals.goals2, constraints: Const.mission.constraints.c2, goals: Const.mission.goals.g2, imgGoals: Const.mission.iconGoals.mission2, timeline: MissionManager.TimelineMissions.init().mission2),
            missions.init(name: Const.mission.name.m3, imgMission: Const.mission.imgMission.img3, header: Const.mission.header.header3, type: Const.mission.type.group, level: Const.mission.level.mini, duration: Const.mission.duration.w4, description: Const.mission.description.desc3, exploration: Const.mission.explorationGoals.goals3, constraints: Const.mission.constraints.c3, goals: Const.mission.goals.g3, imgGoals: Const.mission.iconGoals.mission3, timeline: MissionManager.TimelineMissions.init().tba),
            missions.init(name: Const.mission.name.m4, imgMission: Const.mission.imgMission.img4!, header: Const.mission.header.header4!, type: Const.mission.type.group, level: Const.mission.level.mini, duration: Const.mission.duration.w4, description: Const.caption.tba, exploration: Const.caption.arrayTBA, constraints: Const.caption.arrayTBA, goals: Const.caption.tba, imgGoals: [], timeline: MissionManager.TimelineMissions.init().tba),
            missions.init(name: Const.mission.name.m5, imgMission: Const.mission.imgMission.img5, header: Const.mission.header.header5, type: Const.mission.type.individu, level: Const.mission.level.nano, duration: Const.mission.duration.w2, description: Const.caption.tba, exploration: Const.caption.arrayTBA, constraints: Const.caption.arrayTBA, goals: Const.caption.tba, imgGoals: [], timeline: MissionManager.TimelineMissions.init().tba),
            missions.init(name: Const.mission.name.m6, imgMission: Const.mission.imgMission.img6, header: Const.mission.header.header6, type: Const.mission.type.group, level: Const.mission.level.macro, duration: Const.mission.duration.w12, description: Const.caption.tba, exploration: Const.caption.arrayTBA, constraints: Const.caption.arrayTBA, goals: Const.caption.tba, imgGoals: [], timeline: MissionManager.TimelineMissions.init().tba),
        ]
    }
}
