//
//  GameScene.swift
//  ex02_spritekit
//
//  Created by Leonardo Takuno on 23/04/2018.
//  Copyright © 2018 Apple Developer Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
     let ballCategory: UInt32 = 1 << 1
     let edgeCategory: UInt32 = 1 << 2
     override func didMove(to view: SKView) {
        createBall(px: 100, py: 400)
        createBall(px: 100, py: 300)
        createBall(px:  50, py: 200)
        createBall(px : 50, py: 330)
        
        let edge = SKPhysicsBody(edgeLoopFrom: self.frame)
        edge.categoryBitMask = edgeCategory
        edge.contactTestBitMask =  ballCategory
        edge.collisionBitMask =  ballCategory
        self.physicsBody = edge
    }

    func createBall(px: CGFloat, py: CGFloat){
        let path = CGMutablePath()
        path.addArc(center: CGPoint.zero,
                    radius: 15,
                    startAngle: 0,
                    endAngle: CGFloat.pi * 2,
                    clockwise: true)
        let ball = SKShapeNode(path: path)
        ball.lineWidth = 1
        ball.fillColor = .blue
        ball.strokeColor = .white
        ball.position = CGPoint(x: px, y: py)
        ball.glowWidth = 0.5
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -0.5)
        
        //        let moveUp = SKAction.moveBy(x: 0, y: 100, duration: 3)
        //        let moveRight = SKAction.moveBy(x: 100, y: 0, duration: 3)
        //
        //        ball.run(SKAction.group([moveUp, moveRight]))
        //
        //        let fadeIn = SKAction.fadeIn(withDuration: 1)
        //        let fadeOut = SKAction.fadeOut(withDuration: 1)
        //        let pulse = SKAction.sequence([fadeOut, fadeIn])
        //        let pulseForever = SKAction.repeatForever(pulse)
        //        ball.run(pulseForever)
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        ball.physicsBody!.categoryBitMask = ballCategory
        ball.physicsBody!.contactTestBitMask = ballCategory | edgeCategory
        ball.physicsBody!.collisionBitMask =   ballCategory | edgeCategory
        ball.physicsBody!.affectedByGravity = true
        ball.physicsBody!.isDynamic = true
        ball.physicsBody!.restitution = 1.0
        self.addChild(ball)
    }
    
}
