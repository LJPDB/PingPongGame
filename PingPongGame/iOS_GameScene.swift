//
//  GameScene.swift
//  PingPongGame
//
//  Created by Leonardo Puga-DeBiase on 10/29/16.
//  Copyright © 2016 Leonardo Puga De Biase. All rights reserved.
//

import SpriteKit
import GameplayKit

class iOS_GameScene: SKScene {
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var player = SKSpriteNode()
    
    var enemyScoreValueLbl = SKLabelNode()
    var playerScoreValueLbl = SKLabelNode()
    
    var score = [Int]()
    
    weak var viewController: iOS_VC_GameViewController!
    
    override func didMove(to view: SKView) {
        startGame()
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemyPlayer") as! SKSpriteNode
        player = self.childNode(withName: "mainPlayer") as! SKSpriteNode
        playerScoreValueLbl = self.childNode(withName: "playerScoreValueLbl") as! SKLabelNode
        enemyScoreValueLbl = self.childNode(withName: "enemyScoreValueLbl") as! SKLabelNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx:20, dy:20))
        
        let border = SKPhysicsBody(edgeLoopFrom:self.frame)
        border.restitution = 1
        border.friction = 0
        self.physicsBody = border
    }
    
    func startGame(){
        score = [0,0]
    }
    
    func addScore(playerWhoWon:SKSpriteNode){
        ball.position = CGPoint(x:0, y:0)
        ball.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0)
        if playerWhoWon == player{
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx:20, dy:20))
        }else{
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx:-20, dy:-20))
        }
        playerScoreValueLbl.text = String(score[0])
        enemyScoreValueLbl.text = String(score[1])
        print(score)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            player.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            player.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
        if ball.position.y <= player.position.y - 30 {
            addScore(playerWhoWon: enemy)
        }else if ball.position.y >= enemy.position.y + 30 {
            addScore(playerWhoWon: player)
        }
    }
    
    func pauseGame(){
        if (self.scene!.view!.isPaused) {
            self.scene?.view?.isPaused = false
            viewController.otl_pauseBtn.setTitle("pause", for: UIControlState.normal)
            viewController.navigationController?.setNavigationBarHidden(true, animated: true)
        }else{
            self.scene?.view?.isPaused = true
            viewController.otl_pauseBtn.setTitle("play", for: UIControlState.normal)
            viewController.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
}
