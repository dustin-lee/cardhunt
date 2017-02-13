//
//  CardDeck.swift
//  cupgame2
//
//  Created by Dustin Lee on 12/20/16.
//  Copyright © 2016 Dustin Lee. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class DeckViewController: UIViewController {
    var cards = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54"]
    
    var back = UIImageView!.self
    var front = UIImageView!.self
    
    @IBOutlet weak var leftPlayingCard: UIImageView!
    @IBOutlet weak var playerOne: UILabel!
    var leftScore = 0
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    
    @IBOutlet weak var leftPlayingCardTopLayout: NSLayoutConstraint!
    @IBOutlet weak var rightPlayingCardTopLayout: NSLayoutConstraint!
    var flag: Bool?
    
    @IBOutlet weak var rightPlayingCard: UIImageView!
    @IBOutlet weak var player2: UILabel!
    var rightScore = 0
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!

    func comebackDown() {
        self.leftPlayingCardTopLayout.constant = 130
        self.rightPlayingCardTopLayout.constant = 130
        self.flag = false
    }
    
    @IBAction func drawButtonPressed(_ sender: UIButton) {
        
        if self.flag! {
            self.leftPlayingCardTopLayout.constant = 130
            self.rightPlayingCardTopLayout.constant = 130
            self.flag = false
        } else {
            self.leftPlayingCardTopLayout.constant = -250
            self.rightPlayingCardTopLayout.constant = -250
            leftPlayingCard.image = UIImage(named: "cardback")
            rightPlayingCard.image = UIImage(named:"cardback")
//            comebackDown()
            self.flag = true
        }
// MARK -- ANIMATION CODE ----------------------------------
        self.view.setNeedsLayout()
        UIView.animate(withDuration: 0.6, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.4, options: [UIViewAnimationOptions.allowUserInteraction], animations: {
            self.view.layoutIfNeeded()
        }) { (finished) in
            if finished {
            }
            }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"polygondark")!)
        self.leftPlayingCardTopLayout.constant = -250
        self.rightPlayingCardTopLayout.constant = -250
        self.flag = true
        let appDel = UIApplication.shared.delegate as! AppDelegate
        
        let playa = appDel.playerArr
        self.playerOne.text = playa?[0]
        self.player2.text = playa?[1]
        
    }
//    override func viewDidAppear(_ animated: Bool) {
//        <#code#>
//        //Some Code here
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateWinCardLeft() {
        leftPlayingCard.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 6.0, options: .allowUserInteraction, animations: {
            [weak self] in self?.leftPlayingCard.transform = .identity
        }, completion: nil)
    }
    func animateWinCardRight() {
        rightPlayingCard.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 6.0, options: .allowUserInteraction, animations: {
            [weak self] in self?.rightPlayingCard.transform = .identity
            }, completion: nil)
    }
    
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        
        
        let leftNumber = Int(arc4random_uniform(54))
        leftPlayingCard.image = UIImage(named: cards[leftNumber])
        
        let rightNumber = Int(arc4random_uniform(54))
        rightPlayingCard.image = UIImage(named: cards[rightNumber])

        
        if leftNumber > rightNumber {
            leftScore += 1
            leftScoreLabel.text = String(leftScore)
            animateWinCardLeft()
        }
        else if leftNumber == rightNumber {
            
        }
        else {
            rightScore += 1
            rightScoreLabel.text = String(rightScore)
            animateWinCardRight()
        }
        
    }
    
    

    
}
