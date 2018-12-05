//
//  RandomNumberFactory.swift
//  RaceCalculator
//
//  Created by DerekYang on 12/09/2018.
//  Copyright © 2018 DerekYang All rights reserved.
//

import Foundation
/**Utility class provides operations with random numbers*/
class RandomNumberFactory {
    
    
    let randomOrder = {() -> Int in
    return  Int.random(in: 1...3)
}
    
    let fixedOrder = {(order: Int) -> Int in
        if (order > 0 && order < 3) {
            return order
        } else {
            return 3
        }
        
    }
    
    
     static func generate (order: Int, limit: Int?)  -> Int {
        
        guard (order > 0 && order < 4) else {
            return 0
        }
        
        
        if (limit == nil || limit == 0) {
        switch order {
        case 1: return Int.random(in: 2...9)
            
        case 2: return Int.random(in: 2...99)
            
        case 3: return Int.random(in: 2...999)
        default:
            return 0
        
        }
        }
        else {
            return Int.random(in: 2...limit!)
        }

    }
    
    static func generateInLimits (lower: Int, upper: Int) -> Int {
        assert((lower > 0 && upper > 0 && upper >= lower), "Incorrect limits for random Int")
        return Int.random(in: lower...upper)
    }
    
   
}



