//
//  Constants.swift
//  Explit
//
//  Created by Maulana on 08/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

struct Const {
    
    struct caption {
        static let onboardCaptionPage1 = "Get the mission and let’s explore the space and search a partners to help you if have problem"
        static let onboardCaptionPage2 = "Use board to help organize, track your every progress and making foot note for your mission"
        static let tba = "Coming Soon"
        static let arrayTBA = ["Coming Soon"]
    }
    
    struct image {
        static let imageOnboardPage1 = "Page1Onboard"
        static let imageOmboardPage2 = "Page2Onboard"
        static let sketch = "Sketch"
        static let xcode = "Xcode"
        static let trello = "Trello"
        static let docs = "Docs"
    }
    
    struct identifier {
        static let splashSegue = "splashSegue"
        static let details = "showDetails"
        static let exploreJunior = "juniorExplorerSub"
        static let exploreSenior = "seniorExplorerSub"
        static let detailVC = "detailExplorer"
        
    }
    
    struct mission {
        struct name {
            static let m1 = "Mission 1"
            static let m2 = "Mission 2"
            static let m3 = "Mission 3"
            static let m4 = "Mission 4"
            static let m5 = "Mission 5"
            static let m6 = "Final Mission"
        }
        
        struct imgMission {
            static let img1 = #imageLiteral(resourceName: "Mission1")
            static let img2 = #imageLiteral(resourceName: "Mission2")
            static let img3 = #imageLiteral(resourceName: "Mission3")
            static let img4 = UIImage.init(named: "Mission4")
            static let img5 = #imageLiteral(resourceName: "Mission5")
            static let img6 = #imageLiteral(resourceName: "FinalMission")
        }
        
        struct header {
            static let header1 = #imageLiteral(resourceName: "Mission1Thumbnail")
            static let header2 = #imageLiteral(resourceName: "Mission2Thumbnail")
            static let header3 = #imageLiteral(resourceName: "MIssion3Thumbnail")
            static let header4 = UIImage.init(named: "Mission4Thumbnail")
            static let header5 = #imageLiteral(resourceName: "Mission5Thumbnail")
            static let header6 = #imageLiteral(resourceName: "FinalMissionThumbnail")

        }
        
        struct type {
            static let individu = "Individual Exploring"
            static let group = "Group Exploring"
        }
        
        struct level {
            static let nano = "Nano"
            static let mini = "Mini"
            static let macro = "Macro"
        }
        
        struct duration {
            static let w2 = "2 Weeks"
            static let w4 = "4 Weeks"
            static let w5 = "5 Weeks"
            static let w12 = "12 Weeks"
        }
    
        struct description {
            static let desc1 = "T-63 to Planet The Mini. To prepare for our first planet exploration. we need to explore iOS technology and create tools to aid us for the journey ahead. All explorers are expected to understand basic iOS development during this challenge."
            static let desc2 = "Now it's time to arrive on the Nano planet. The second exploration is individual, we need to take a small spaceship to explore more planets. We need to explore self skills on using sketch prototype, make app deconstruction and learning backlog, make apps using xcode, and feedback report document. Hopefully all explorers can applied the investigation and code the apps"
            static let desc3 = "We currently arrived at Mini planet. The third exploration we need to collaborate again to explore this planet using iOS Technology. We need to explore building some apps with understanding user, how to implement best practice of coding, and try to practice project management."
        }
        
        struct explorationGoals {
            static let goals1 = ["Full Cycle CBL", "HIG (Human Interface Guidlines", "Prototyping","Xcode & Basic Swift", "Group Collaboration"]
            static let goals2 = ["Applied Investigation", "Everyone can code"]
            static let goals3 = ["Collaboration", "Best Practice Coding", "Understanding User", "Best Practice Project Management"]
        }
        
        struct constraints {
            static let c1 = ["No Game", "No Back Ends", "No Augmented Reality"]
            static let c2 = ["Individual Work", "No Third-Party Library", "Use HIG Essentials"]
            static let c3 = ["No Constraint"]
        }
        
        struct goals {
            static let g1 = "Working Prototype"
            static let g2 = "Sketch Prototype, Learning Backlog Document, Xcode Project, Feedback Report Document"
            static let g3 = "User Narration, Trello for Project, Working Appw with Clean Code"
        }
        
        struct iconGoals {
            static let mission1 = [Const.image.xcode, Const.image.sketch]
            static let mission2 = [Const.image.sketch, Const.image.xcode, Const.image.docs]
            static let mission3 = [Const.image.sketch, Const.image.xcode, Const.image.trello, Const.image.docs]
        }
    }
    
    struct timeline {
        struct mission1 {
            struct date {
                static let time1 = "21 FEB"
                static let time2 = "28 FEB"
                static let time3 = "6 MAR"
                static let time4 = "13 MAR"
                static let time5 = "27 MAR"
                static let time6 = "31 MAR"
            }
            
            struct title {
                static let title1 = "Welcome Mission"
                static let title2 = "Checkpoint 1"
                static let title3 = "Checkpoint 1"
                static let title4 = "Checkpoint 1"
                static let title5 = "Checkpoint 1"
                static let title6 = "Checkpoint 1"
            }
            
            struct description {
                static let desc1 = "Brief the mission and search the partner explorer based on interest to exploring mission together."
                static let desc2 = "Present the solution concept with the what the problem based the group interest."
                static let desc3 = "Present the prototyping interface concept of apps using Sketch."
                static let desc4 = "Present the prototype of apps using Storyboard of Xcode."
                static let desc5 = "Submit the Keynote file toe use presentation and with the video overview the final apps."
                static let desc6 = "Present the research of apps and the video overview the final apps then get the review from Expert."
            }
        }
        
        struct mission2 {
            struct date {
                static let time1 = "6 APR"
                static let time2 = "16 APR"
                static let time3 = "17 APR"
            }
            
            struct title {
                static let title1 = "Welcome Mission"
                static let title2 = "Checkpoint 1"
                static let title3 = "Checkpoint 2 (Review)"
            }
            
            struct description {
                static let desc1 = "Brief the mission about instruction and what apps will build."
                static let desc2 = "Submit the prototyping interface concept of apps using Sketch and App Deconstruction with the backlog document."
                static let desc3 = "Present or submit the xcode project of the apps."
            }
        }
    }
    
    struct explorers {
        static let shift = "Class"
        static let role = "Role"
        static let tech = "Tech"
        static let design = "Design"
        static let business = "Business"
        
        struct facilitator {
            static let tech = "Coding Facilitator "
            static let am = "Academy Manager"
            static let design = "Design Facilitator "
            static let professional = "Professional Facilitator "
        }
    }
    

    
}
