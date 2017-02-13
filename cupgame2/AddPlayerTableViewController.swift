//
//  AddPlayerTableViewController.swift
//  cupgame2
//
//  Created by Dustin Lee on 12/20/16.
//  Copyright © 2016 Dustin Lee. All rights reserved.
//

import Foundation

import UIKit
import CoreData

class AddPlayerTableViewController: UITableViewController {
    
//    var players = [Players]()
    
//    var players = ["player 1", "player 2", "player 3", "player 4", "player 5", "player 6", "player 7", "player 8", "player 9", "player 10"]
    
    var players = [String]()
    
    var showPlayers: Players?
    
//    var players = ["Player 1"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of players
        return players.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        //        let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell")!
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = self.players[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        // return the cell so that it can be rendered
        return cell
    }
//Mark-- Add button ----------------------------------------------
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBAction func addPlayerButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "New Player Name", message: "Add a new name", preferredStyle: .alert )
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { (action:UIAlertAction) -> Void in
            
            let textField = alert.textFields!.first
            self.players.append(textField!.text!)
            
            // cache the data in appDel
            let appDel = UIApplication.shared.delegate as! AppDelegate
            
            appDel.playerArr = self.players
            
            self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action: UIAlertAction) -> Void in }
        alert.addTextField {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
       
    }
// end add button ----------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
// Mark -- Remove Button Clicked ******************************
    @IBAction func removebuttonPressed(_ sender: UIButton) {
        print("trying to delete")
        func deleteCell(cell: UITableViewCell){
            print("in function deletion")
            if let deletionIndexPath = tableView.indexPath(for: cell) {
                players.remove(at: deletionIndexPath.row)
                tableView.deleteRows(at: [deletionIndexPath], with: .automatic)
//                self.tableView!.reloadData()
            }
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            players.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        
    }


}
