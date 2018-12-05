//
//  Distribution.swift
//  RaceCalculator
//
//  Created by DerekYang on 17/11/2018.
//  Copyright © 2018 DerekYang All rights reserved.
//

import Foundation
/**Utility class provides probability distribution logic to mix various tasks together*/
enum Distribution: Int {
    case optionOne = 1
    case optionTwo = 2
    
    static func generate(from: Int, to: Int, separateBy: Int) -> Distribution {
        assert((from > 0 && to > 0 && separateBy > 0 && to > from && to > separateBy), "Wrong arguents")
        
        let distribution: Distribution
        
        let number = Int.random(in: from...to)
        
        if number <= separateBy {
            distribution = Distribution(rawValue: 1)!
        } else {
            distribution = Distribution(rawValue: 2)!
        }
    return distribution
        
        
    }
    
    
}
