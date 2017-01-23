//
//  VC_GameMenu.swift
//  PingPongGame
//
//  Created by Leonardo Puga-DeBiase on 12/1/16.
//  Copyright © 2016 Leonardo Puga De Biase. All rights reserved.
//

import Foundation
import UIKit
import SWRevealViewController

class VC_GameMenu: UITableViewController {
    
    override func viewDidLoad() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "menuOpt", for: indexPath)
        
        // Configure the cell...
        if indexPath.row == 0 {
            
            cell.detailTextLabel?.text = "description for option 1"
            //cell.postImageView.image = UIImage(named: "watchkit-intro")
            //cell.postTitleLabel.text = "WatchKit Introduction: Building a Simple Guess Game"
            //cell.authorLabel.text = "Simon Ng"
            //cell.authorImageView.image = UIImage(named: "author")
            
        } else if indexPath.row == 1 {
            cell.detailTextLabel?.text = "description for option 2"
            //cell.postImageView.image = UIImage(named: "custom-segue-featured-1024")
            //cell.postTitleLabel.text = "Building a Chat App in Swift Using Multipeer Connectivity Framework"
            //cell.authorLabel.text = "Gabriel Theodoropoulos"
            //cell.authorImageView.image = UIImage(named: "appcoda-300")
            
        } else {
            cell.detailTextLabel?.text = "description for option 3"
            //cell.postImageView.image = UIImage(named: "webkit-featured")
            //cell.postTitleLabel.text = "A Beginner’s Guide to Animated Custom Segues in iOS 8"
            //cell.authorLabel.text = "Gabriel Theodoropoulos"
            //cell.authorImageView.image = UIImage(named: "appcoda-300")
            
        }
        
        return cell
    }
    
}
