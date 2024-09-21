//
//  LeaderboardViewController.swift
//  YOLO
//
//  Created by Luke Huang on 9/21/24.
//  Copyright © 2024 Ultralytics. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    let leaderboardData = [
            "1. User1 - 1000 points",
            "2. User2 - 950 points",
            "3. User3 - 900 points"
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Register a basic UITableViewCell if no custom cell in the storyboard
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // Number of rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderboardData.count
    }
    
    // Provide data for each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = leaderboardData[indexPath.row]
        return cell
    }

}

