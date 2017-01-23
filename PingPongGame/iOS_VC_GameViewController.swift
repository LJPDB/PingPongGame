//
//  GameViewController.swift
//  PingPongGame
//
//  Created by Leonardo Puga-DeBiase on 10/29/16.
//  Copyright © 2016 Leonardo Puga De Biase. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import SWRevealViewController

class iOS_VC_GameViewController: UIViewController {
    
    @IBOutlet weak var otl_pauseBtn: UIButton!
    var currentGame: iOS_GameScene!
    @IBOutlet weak var menu_btn: UIBarButtonItem!
    
    @IBAction func btn_pausePressed(_ sender: Any) {
        
        self.currentGame.pauseGame()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.otl_pauseBtn.setTitle("pause", for: UIControlState.normal)
        if revealViewController() != nil {
            //self.revealViewController().rearViewRevealWidth = 62
            menu_btn.target = self.revealViewController()
            menu_btn.action = #selector(SWRevealViewController.revealToggle(_:))
            //otl_menuBtn.target(forAction: #selector(SWRevealViewController.revealToggle(_:)), withSender: self.revealViewController())
            
            //self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "iOS_GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                currentGame = scene as! iOS_GameScene
                currentGame.viewController = self
            }
            
            view.ignoresSiblingOrder = true            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
}
