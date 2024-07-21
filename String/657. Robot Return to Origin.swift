//
//  657. Robot Return to Origin.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/20.
//

import Foundation

class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        var moves = moves
        var leftCount = 0, rightCount = 0, upCount = 0 , downCount = 0
        while !moves.isEmpty {
            var move = moves.removeFirst()
            if move == "L" { leftCount += 1 }
            else if move == "R" { rightCount += 1 }
            else if move == "U" { upCount += 1 }
            else if move == "D" { downCount += 1}
        }
        return leftCount == rightCount && upCount == downCount
    }
}
