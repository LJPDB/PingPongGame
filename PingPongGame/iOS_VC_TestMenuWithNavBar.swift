//
//  iOS_VC_TestMenuWithNavBar.swift
//  PingPongGame
//
//  Created by Leonardo Puga-DeBiase on 12/1/16.
//  Copyright © 2016 Leonardo Puga De Biase. All rights reserved.
//

import UIKit
import SWRevealViewController

class iOS_VC_TestMenuWithNavBar: UIViewController {

    @IBOutlet weak var menu: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        if revealViewController() != nil {
            //self.revealViewController().rearViewRevealWidth = 62
             menu.target = self.revealViewController()
             menu.action = #selector(SWRevealViewController.revealToggle(_:))
            //otl_menuBtn.target(forAction: #selector(SWRevealViewController.revealToggle(_:)), withSender: self.revealViewController())
            
            //self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
 
    }

}
