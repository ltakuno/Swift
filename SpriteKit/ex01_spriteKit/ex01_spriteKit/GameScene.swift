//
//  GameScene.swift
//  ex01_spriteKit
//
//  Created by Leonardo Takuno on 19/04/2018.
//  Copyright © 2018 Apple Developer Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
        
    override func didMove(to view: SKView) {
        criar_label(mensagem: "Olá pessoal!")
        criar_shape()
        
//        let spriteNode = SKSpriteNode(imageNamed: "spaceship")
//        spriteNode.size = CGSize(width: 200, height : 200)
//        spriteNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//        spriteNode.position = CGPoint(x:self.frame.size.width/2, y:self.frame.size.height * 0.50)
//        spriteNode.zPosition = 100
//        spriteNode.name = "Spaceship"
//        self.addChild(spriteNode)
//
//        let moveAction = SKAction.moveBy(x: view.frame.size.width * 0.0, y: view.frame.size.height * 0.5, duration: 5)
//        spriteNode.run(moveAction)
    }
    
    func criar_shape(){
        let path = CGMutablePath()
        path.addArc(center: CGPoint.zero,
                    radius: 15,
                    startAngle: 0,
                    endAngle: CGFloat.pi * 2,
                    clockwise: true)
        let ball = SKShapeNode(path: path)
        ball.lineWidth = 1
        ball.fillColor = .blue
        ball.strokeColor = .yellow
        ball.glowWidth = 0.5
        ball.position = CGPoint(x: 100, y: 100)
        self.addChild(ball)
    }
    
    func criar_label(mensagem: String){
        backgroundColor = .white
        let label = SKLabelNode(fontNamed:"Chalkduster")
        label.text = mensagem
        label.fontSize = 30
        label.fontColor = SKColor.blue
        label.position = CGPoint(x:self.frame.size.width/2, y:self.frame.size.height * 0.75)
        label.zPosition = 101
        self.addChild(label)
    }
    
    
}
