//
//  Solvable.swift
//  RaceCalculator
//
//  Created by DerekYang on 30/10/2018.
//  Copyright © 2018 DerekYang All rights reserved.
//

import Foundation
/**Protocol that all task types conform to*/

enum EN_OPERATOR
{
    case EN_OP_ADD
    case EN_OP_SUB
    case EN_OP_MUL
    case EN_OP_DIV
    case EN_OP_MOD
}

protocol Solvable {
    var level: Level { get }
    var a: Int { get }
    var b: Int { get }
    var result: Int { get }
    
    init (lv: Level, op: EN_OPERATOR)
}
