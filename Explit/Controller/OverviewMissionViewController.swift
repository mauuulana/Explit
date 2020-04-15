//
//  OverviewMissionViewController.swift
//  Explit
//
//  Created by Maulana on 14/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class OverviewMissionViewController: UIViewController {
    
    @IBOutlet weak var descDetail: UILabel!
    @IBOutlet weak var tableExploration: UITableView!
    
    var descMissionFinal = ""
    var listExplorationFinal: [String] = []

    override func viewWillAppear(_ animated: Bool) {
    
               
        tableExploration.delegate = self
        tableExploration.dataSource = self
               
        descDetail.text = descMissionFinal
    }

        // Do any additional setup after loading the view.

}

extension OverviewMissionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listExplorationFinal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellExploration = tableExploration.dequeueReusableCell(withIdentifier: "exploration", for: indexPath) as! ExplorationViewCell
        
        let cellIndex = indexPath.item
        cellExploration.listExploration.text = listExplorationFinal[cellIndex]
        
        return cellExploration
    }
    
    
}
