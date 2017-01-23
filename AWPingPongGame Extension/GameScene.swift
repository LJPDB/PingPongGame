//
//  GameScene.swift
//  AWPingPongGame Extension
//
//  Created by Leonardo Puga-DeBiase on 10/29/16.
//  Copyright © 2016 Leonardo Puga De Biase. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var player = SKSpriteNode()
    var motionManager: CMMotionManager!
    
    var enemyScoreValueLbl = SKLabelNode()
    var playerScoreValueLbl = SKLabelNode()
    
    var score = [Int]()
    
    
    override func sceneDidLoad() {
        startGame()
        
        //get accelerometer changes
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates()
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemyPlayer") as! SKSpriteNode
        player = self.childNode(withName: "mainPlayer") as! SKSpriteNode
       // playerScoreValueLbl = self.childNode(withName: "playerScoreValueLbl") as! SKLabelNode
       // enemyScoreValueLbl = self.childNode(withName: "enemyScoreValueLbl") as! SKLabelNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx:10, dy:10))
        
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
            ball.physicsBody?.applyImpulse(CGVector(dx:10, dy:10))
        }else{
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx:-10, dy:-10))
        }
        playerScoreValueLbl.text = String(score[0])
        enemyScoreValueLbl.text = String(score[1])
        print(score)
    }
    
    func movesBegan(wristMoves: CMAccelerometerData) {
        player.run(SKAction.moveTo(x: CGFloat(wristMoves.acceleration.x * 250), duration: 0.1))
    }

    
    
    override func update(_ currentTime: TimeInterval) {
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.4))
        if ball.position.y <= player.position.y - 5 {
            addScore(playerWhoWon: enemy)
        }else if ball.position.y >= enemy.position.y + 5 {
            addScore(playerWhoWon: player)
        }
        if let accelerometerData = motionManager.accelerometerData {
            movesBegan(wristMoves: accelerometerData)
            //physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.y * -50, dy: accelerometerData.acceleration.x * 50)
            print("accelerometer changing X: \(accelerometerData.acceleration.x)")
        }
    }
}
