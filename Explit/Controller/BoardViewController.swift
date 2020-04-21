//
//  BoardViewController.swift
//  Explit
//
//  Created by Maulana on 16/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit
import CoreData

class BoardViewController: UIViewController {
    
    @IBOutlet weak var collectionBoard: UICollectionView!
    
    var board = [Board]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionBoard.dataSource = self
        collectionBoard.delegate = self
        
        
    let fetchRequest: NSFetchRequest<Board> = Board.fetchRequest()
               
        do {
            let board = try PersistenceService.context.fetch(fetchRequest)
            self.board = board
            self.collectionBoard.reloadData()
        } catch {}
        
        updateCollectionViewItem(with: view.bounds.size)
        
    }
    
    @IBAction func addMission(_ sender: UIButton) {
        let alertPopup = UIAlertController(title: "Add Mission", message: nil, preferredStyle: .alert)
        alertPopup.addTextField(configurationHandler: nil)
        alertPopup.addAction(UIAlertAction(title: "Add", style: .default, handler: { (_) in
            guard let missionName = alertPopup.textFields?.first?.text, !missionName.isEmpty else {
                return
            }
            
            let name = Board(context: PersistenceService.context)
            name.mission = missionName
            PersistenceService.saveContext()
            self.board.append(name)
            
            let addedNewMission = IndexPath(item: self.board.count - 1, section: 0)
            
            self.collectionBoard.insertItems(at: [addedNewMission])
            self.collectionBoard.scrollToItem(at: addedNewMission, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        }))
        
        alertPopup.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertPopup, animated: true)
    }
}

extension BoardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return board.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellBoard = collectionBoard.dequeueReusableCell(withReuseIdentifier: "cellBoard", for: indexPath) as! BoardCollectionViewCell
        
        cellBoard.setupBoard(with: board[indexPath.item])
        cellBoard.boardView = self
        
        return cellBoard
        
    }
}

extension BoardViewController: UICollectionViewDelegateFlowLayout {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateCollectionViewItem(with: size)
    }
       
    private func updateCollectionViewItem(with size: CGSize) {
        guard let layout = collectionBoard.collectionViewLayout as? UICollectionViewFlowLayout else {
               return
        }
        layout.itemSize = CGSize(width: 225, height: size.height * 0.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 12, bottom: 12, right: 12)
    }
    
}


