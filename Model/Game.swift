//
//  Game.swift
//  RaceCalculator
//
//  Created by DerekYang on 18/10/2018.
//  Copyright © 2018 DerekYang All rights reserved.
//

import Foundation
/**Class generates task according to chosen task type and difficulty level*/
class Game {
    let gameCategory: GameCategory
    let gameLevel: Level
    var gameScore = Score()
    
    init(gameCategory: GameCategory, gameLevel: Level) {
        self.gameCategory = gameCategory
        self.gameLevel = gameLevel
    }
    
        
     func generateTask(category: GameCategory, level: Level) -> Solvable {
        switch category {
        case .addition: return Calculator(lv: level, op: .EN_OP_ADD)
        case .substraction: return Calculator(lv: level, op: .EN_OP_SUB)
        case .multiplication: return Calculator(lv: level, op: .EN_OP_MUL)
        case .division: return Calculator(lv: level, op: .EN_OP_DIV)
        case .mod: return Calculator(lv: level, op: .EN_OP_MOD)
        }
    }
    
    

}
