//
//  Calculator.swift
//  RaceCalculator
//
//  Created by DerekYang on 2018/11/26.
//  Copyright © 2018 DerekYang All rights reserved.
//

import Foundation



class Calculator: Solvable {
    let level: Level
    let a: Int
    let b: Int
    let result: Int
    
    required init(lv: Level, op: EN_OPERATOR) {
        
        self.level = lv
        
        switch level {
        case .easy:
            a =  RandomNumberFactory.generateInLimits(lower: 2, upper: 99)
            b =  RandomNumberFactory.generateInLimits(lower: 2, upper: 9)
            
        case .normal:
            a =  RandomNumberFactory.generateInLimits(lower: 10, upper: 999)
            b =  RandomNumberFactory.generateInLimits(lower: 2, upper: 99)
            
        case .hard:
            a =  RandomNumberFactory.generateInLimits(lower: 100, upper: 9999)
            b =  RandomNumberFactory.generateInLimits(lower: 10, upper: 999)
            
        }
        
        switch op {
        case .EN_OP_ADD:
            result = a + b
        case .EN_OP_SUB:
            result = a - b
        case .EN_OP_MUL:
            result = a * b
        case .EN_OP_DIV:
            result = a / b
        case .EN_OP_MOD:
            result = a % b
        }
    }
    
    
    
}
