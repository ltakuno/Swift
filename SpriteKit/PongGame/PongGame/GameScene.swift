//
//  GameScene.swift
//  PongGame
//
//  Created by Leonardo Takuno on 24/04/2018.
//  Copyright © 2018 academysenac. All rights reserved.
//

import SpriteKit

let BallCategory: UInt32 = 0x1 << 1
let RacketCategory: UInt32 = 0x1 << 2
let WorldCategory: UInt32 = 0x1 << 3
let BlockCategory: UInt32 = 4294967295
let GroundCategory: UInt32 = 0x1 << 4

class GameScene: SKScene {
    
    private var ball: SKSpriteNode!
    private var racket: SKSpriteNode!
    private var score: SKLabelNode!
    
    private var points = 0
    
    override func didMove(to view: SKView) {
        
        // Load the SpriteNodes
        ball = childNode(withName: "ball") as! SKSpriteNode
        racket = childNode(withName: "racket") as! SKSpriteNode
        score = childNode(withName: "score") as! SKLabelNode
        
        // Score initialization
        score.text = String(points)
        
        // Define the world frame
        let worldFrame = view.scene?.frame
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: worldFrame!)
        self.physicsBody?.friction = 0
        
        // Associate collision categories
        ball.physicsBody?.categoryBitMask = BallCategory
        ball.physicsBody?.contactTestBitMask = RacketCategory | WorldCategory | BlockCategory | GroundCategory

        racket.physicsBody?.categoryBitMask = RacketCategory
        self.physicsBody?.categoryBitMask = WorldCategory
        
        // Create the ground
        let bottomRect = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: 1)
        let ground = SKNode()
        ground.physicsBody = SKPhysicsBody(edgeLoopFrom: bottomRect)
        ground.physicsBody?.categoryBitMask = GroundCategory
        addChild(ground)
        
        // Associate a delegate for collisions
        self.physicsWorld.contactDelegate = self
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        let previousLocation = touch!.previousLocation(in: self)
        
        let racketNewPositionX = racket.position.x + (touchLocation.x - previousLocation.x)
        
        racket.position = CGPoint(x: racketNewPositionX, y: racket.position.y)
    }
} // end of GameScene

extension GameScene : SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let bodyA = contact.bodyA.categoryBitMask
        let bodyB = contact.bodyB.categoryBitMask
        
        if bodyA == RacketCategory || bodyB == RacketCategory {
            ball.physicsBody?.velocity.dx = (ball.physicsBody?.velocity.dx)! + 1
            ball.physicsBody?.velocity.dy = (ball.physicsBody?.velocity.dy)! + 30
        }
        if bodyA == BlockCategory {
            contact.bodyA.node?.removeFromParent()
            contact.bodyA.node?.physicsBody = nil
            contact.bodyA.node?.removeAllActions()
            points = points + 1
        }
        if bodyB == BlockCategory {
            contact.bodyB.node?.removeFromParent()
            contact.bodyB.node?.physicsBody = nil
            contact.bodyB.node?.removeAllActions()
            points = points + 1
        }
        
        score.text = String(points)
        
        if bodyA == GroundCategory || bodyB == GroundCategory {
            guard let gameOverScene = SKScene(fileNamed: "GameOverScene") else { return }
            gameOverScene.scaleMode = .aspectFit
            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
            view?.presentScene(gameOverScene, transition: reveal)
        }
        
        
        
        
        
        
        
        
    }
    
}

