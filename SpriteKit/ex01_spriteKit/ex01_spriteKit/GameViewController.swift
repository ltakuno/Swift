//
//  GameViewController.swift
//  ex01_spriteKit
//
//  Created by Leonardo Takuno on 19/04/2018.
//  Copyright © 2018 Apple Developer Academy. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        let scene = GameScene(size: view.frame.size)
        let skview = self.view as! SKView
        skview.presentScene(scene)
    }
}
