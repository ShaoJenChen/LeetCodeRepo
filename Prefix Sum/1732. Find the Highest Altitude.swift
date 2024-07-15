//
//  1732. Find the Highest Altitude.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/15.
//

import Foundation

class Solution {
    func largestAltitude(_ gain: [Int]) -> Int {
        var altitude = 0
        var prefixSum = 0
        for alt in gain {
            prefixSum += alt
            if prefixSum > altitude { altitude = prefixSum }
        }
        return altitude
    }
}
