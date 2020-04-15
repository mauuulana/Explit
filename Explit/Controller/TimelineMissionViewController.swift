//
//  TimelineMissionViewController.swift
//  Explit
//
//  Created by Maulana on 14/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class TimelineMissionViewController: UIViewController {
    
    @IBOutlet weak var listTimelineMission: UITableView!
    
    var listTimelineFinal: [Timeline] = []

    override func viewWillAppear(_ animated: Bool) {
     
        listTimelineMission.delegate = self
        listTimelineMission.dataSource = self

        // Do any additional setup after loading the view.
    }
}

extension TimelineMissionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTimelineFinal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTimeline = listTimelineMission.dequeueReusableCell(withIdentifier: "timelineList", for: indexPath) as! TimelineTableViewCell
        
        let cellIndex = indexPath.item
        cellTimeline.dateTimelineLabel.text = listTimelineFinal[cellIndex].date
        cellTimeline.titleTimelineLabel.text =
            listTimelineFinal[cellIndex].title
        cellTimeline.descTimelineLabel.text =
            listTimelineFinal[cellIndex].descTimeline
        
        return cellTimeline
    }
    
    
}
