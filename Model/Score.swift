//
//  Score.swift
//  RaceCalculator
//
//  Created by DerekYang on 19/10/2018.
//  Copyright © 2018 DerekYang All rights reserved.
//

import Foundation
/**Class provides scoring task logic*/
class Score {
    private var currentScore = 0
    private var topScore = 0
    
    let gameData = UserDefaults.standard
    let topScoreKey = "topScore"
    
   func getScore() -> Int {
    return currentScore
    }
    
    func setScore(newValue: Int) {
        currentScore = newValue
    }
    
    func updateTopScore() {
        topScore = getTopScore()
        
        if (currentScore > topScore) {
    
            topScore = currentScore
            
            gameData.set(topScore, forKey: topScoreKey)
            
        }
    }
    func getTopScore() -> Int {
        
        if gameData.object(forKey: topScoreKey) == nil {
            return 0
        } else {
             return gameData.integer(forKey: topScoreKey)
        }
        
    }
    
}
