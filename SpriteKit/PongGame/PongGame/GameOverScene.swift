//
//  GameOverScene.swift
//  PongGame
//
//  Created by Leonardo Takuno on 24/04/2018.
//  Copyright © 2018 academysenac. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let touchNode = atPoint(location!)
        
        if touchNode == childNode(withName: "restart") {
            guard let gameScene = SKScene(fileNamed: "GameScene") else { return }
            gameScene.scaleMode = .aspectFit
            view?.presentScene(gameScene)
        }
    }
}
