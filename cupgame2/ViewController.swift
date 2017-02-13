//
//  ViewController.swift
//  cupgame2
//
//  Created by Dustin Lee on 12/20/16.
//  Copyright © 2016 Dustin Lee. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class ViewController: UIViewController {
    // Mark - ARROWS FLYING IN ----------------------------------------------
    @IBOutlet weak var cardArrow: UIImageView!
    @IBOutlet weak var cardArrowLeftLayout: NSLayoutConstraint!
    @IBOutlet weak var huntArrow: UIImageView!
    @IBOutlet weak var huntArrowRightLayout: NSLayoutConstraint!
    
    @IBOutlet weak var fireGif: UIImageView!
    @IBOutlet weak var cardHuntImage: UIImageView!
    @IBOutlet weak var cardHuntLeftLayout: NSLayoutConstraint!
    
    //Mark-PLAY BUTTON / How To Play Layout---------------------------------
    @IBOutlet weak var playButtonLeftLayout: NSLayoutConstraint!
    @IBOutlet weak var howtoPlayRightLayout: NSLayoutConstraint!

    
    func comingback() {
        self.cardHuntLeftLayout.constant = 50
        self.playButtonLeftLayout.constant = 0
        self.howtoPlayRightLayout.constant = -0
        self.view.setNeedsLayout()
        UIView.animate(withDuration: 0.6, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.4, options: [UIViewAnimationOptions.allowUserInteraction], animations: {
            self.view.layoutIfNeeded()
        }) { (finished) in
            if finished {
            }
        }
    }
    
    func arrowShooting() {
        self.cardArrowLeftLayout.constant = 20
        self.huntArrowRightLayout.constant = 35
        self.view.setNeedsLayout()
        UIView.animate(withDuration: 0.6, delay: 1.2, options: [UIViewAnimationOptions.allowUserInteraction], animations: {
            self.view.layoutIfNeeded()
        }) { (finished) in
            if finished {
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.cardHuntLeftLayout.constant = -300
        self.playButtonLeftLayout.constant = -500
        self.howtoPlayRightLayout.constant = -500
        self.cardArrowLeftLayout.constant = -500
        self.huntArrowRightLayout.constant = -500
        
        let jeremyGif = UIImage.gifImageWithName("myfiretwo")
        let imageView = UIImageView(image: jeremyGif)
        imageView.frame = CGRect(x: 20.0, y: 350.0, width: self.view.frame.size.width - 30, height: 250.0)
        view.addSubview(imageView)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        comingback()
        arrowShooting()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
// MARK -- PLAY BUTTON CLICKED ***************

    @IBOutlet weak var playButtonLabel: UIButton!
    
    @IBAction func playButtonClicked(_ sender: UIButton) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "addPlayerVC") as! AddPlayerViewController
        self.present(view, animated: true, completion: nil)
    }
// MARK -- HOW TO PLAY CLICKED ***************
    @IBOutlet weak var howtoPlayLabel: UIButton!
    @IBAction func howToPlayPressed(_ sender: UIButton) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "howtoPlayVC") as! HowToPlayViewController
        self.present(view, animated: true, completion: nil)
    }
    
}

