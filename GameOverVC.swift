//
//  GameOverVC.swift
//  RaceCalculator
//
//  Created by DerekYang on 14/11/2018.
//  Copyright © 2018 DerekYang All rights reserved.
//

import UIKit

class GameOverVC: UIViewController {
    
    @IBOutlet weak var backToMainMenuButton: UIButton!
    
    var displayedScore: Int = 0

    var wrongList = [String]()
    
    @IBOutlet weak var scoreLabel: UILabel!
    
  
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(backToMainMenuButtonPressed(_:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        

        scoreLabel.text = "\u{1F3C6}Your score: \(displayedScore)"
        
    }
    //return to Select Category 
    @IBAction func backToMainMenuButtonPressed(_ sender: UIButton) {
        let controllerStack = self.navigationController?.viewControllers
        _ = self.navigationController?.popToViewController((controllerStack?[1])!, animated: true)
    }
    
}

extension GameOverVC: UITableViewDataSource
{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.wrongList.count)
        return self.wrongList.count
    }
    
    
 
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = "\(self.wrongList[indexPath.row])"
        return cell
    }
}
