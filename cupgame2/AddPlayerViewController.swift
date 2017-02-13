//
//  AddPlayerViewController.swift
//  cupgame2
//
//  Created by Dustin Lee on 12/20/16.
//  Copyright © 2016 Dustin Lee. All rights reserved.
//

import UIKit

class AddPlayerViewController: UIViewController {
    
    @IBOutlet weak var backButtonPressed: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "EmbededTablePlayer" {
//            
//            let distinationVC = segue.destination as? AddPlayerTableViewController //replace EmbeddedTableViewController with your tableViewControllerClass
//            
////            distinationVC?.showPlayers = players! //yourDataArray is in your main view and you should define data array in your embedded table view controller
//            
//        }
//        
//    }
//Mark -- back button pressed -----------------------
    
    @IBAction func backButtonHit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
     
    @IBAction func beginButtonPressed(_ sender: UIButton) {
//        let view = self.storyboard?.instantiateViewController(withIdentifier: "gameViewVC") as! DeckViewController
//        self.present(view, animated: true, completion: nil)
        
        let appDel = UIApplication.shared.delegate as! AppDelegate
        
        let playa = appDel.playerArr
//        for play in playa! {
//            print(play)
            if playa == nil {
                let title = "Error"
                let message = "Please add Two Players before Proceeding"
                let okText = "OK"
                let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
                let okayButton = UIAlertAction(title: okText, style: UIAlertActionStyle.cancel, handler: nil)
                
                present(alert, animated: true, completion: nil)
                alert.addAction(okayButton)
            } else {
                let view = self.storyboard?.instantiateViewController(withIdentifier: "gameViewVC") as! DeckViewController
                self.present(view, animated: true, completion: nil)
            }
//        }
        
    }
    
}
