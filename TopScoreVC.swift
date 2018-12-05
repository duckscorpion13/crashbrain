//
//  TopScoreVC.swift
//  RaceCalculator
//
//  Created by DerekYang on 14/11/2018.
//  Copyright © 2018 DerekYang All rights reserved.
//

import UIKit

class TopScoreVC: UIViewController {
    @IBOutlet weak var topScoreLabel: UILabel!
    
    private let score = Score()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topScoreLabel.text = "\u{1F3C6}Top score: \(score.getTopScore())"
      
    }

}
