//
//  GameScene.swift
//  cupgame2
//
//  Created by Dustin Lee on 12/20/16.
//  Copyright © 2016 Dustin Lee. All rights reserved.
//

//import SpriteKit
//
//enum CardType :Int {
//    case 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55
//}
//
//class Card : SKSpriteNode {
//    let cardType :CardType
//    let frontTexture :SKTexture
//    let backTexture :SKTexture
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("NSCoding not supported")
//    }
//    
//    init(cardType: CardType) {
//        self.cardType = cardType
//        backTexture = SKTexture(imageNamed: "card_back")
//        
//        switch cardType {
//        case .wolf:
//            frontTexture = SKTexture(imageNamed: "card_creature_wolf")
//        case .bear:
//            frontTexture = SKTexture(imageNamed: "card_creature_bear")
//        case .dragon:
//            frontTexture = SKTexture(imageNamed: "card_creature_dragon")
//        }
//        
//        super.init(texture: frontTexture, color: .clear, size: frontTexture.size())
//    }
//}
