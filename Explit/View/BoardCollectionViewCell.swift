//
//  BoardCollectionViewCell.swift
//  Explit
//
//  Created by Maulana on 16/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class BoardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tableBoard: UITableView!

    var boardView: BoardViewController?
    var board: Board?
    var arrayOfNotes: [String]? = []
    var notesMission: NSObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10.0

        tableBoard.tableFooterView = UIView()

    }

    func setupBoard(with listBoard: Board) {
        self.board = listBoard
        if let notes =  listBoard.notes as? [String]{
            self.arrayOfNotes = notes
        }
        
        tableBoard.reloadData()
    }

    @IBAction func addNotes(_ sender: Any) {
        let alertPopup = UIAlertController(title: "Add Notes", message: nil, preferredStyle: .alert)
        alertPopup.addTextField(configurationHandler: nil)

        alertPopup.addAction(UIAlertAction(title: "Add", style: .default, handler: { (_) in
            guard let notesText = alertPopup.textFields?.first?.text, !notesText.isEmpty else {
                return
            }
            guard let listBoard = self.board else {
                return
            }
            
            self.arrayOfNotes?.append(notesText)
            //self.notesMission = self.arrayOfNotes as! NSObject

            //let notes = Board(context: PersistenceService.context)
            //notes.notes = self.notesMission
            listBoard.notes = self.arrayOfNotes as! NSObject
            PersistenceService.saveContext()

            //listBoard.notes?.setValue(notes, forKey: "notes")
            let addNotes = IndexPath(item: (self.arrayOfNotes?.count)! - 1, section: 0)

            self.tableBoard.insertRows(at: [addNotes], with: .automatic)
            self.tableBoard.scrollToRow(at: addNotes, at: UITableView.ScrollPosition.bottom, animated: true)
        }))

        alertPopup.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        boardView?.present(alertPopup, animated: true, completion: nil)
    }
 
}

    extension BoardCollectionViewCell: UITableViewDataSource, UITableViewDelegate {

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arrayOfNotes?.count ?? 0
        }

        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return board?.mission
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellBoard", for: indexPath)
            //let indexing = indexPath.item
            let cellNotes = board!.notes
            cell.textLabel?.text = self.arrayOfNotes![indexPath.row]
            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }

    }
