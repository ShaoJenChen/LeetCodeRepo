//
//  1431. Kids With the Greatest Number of Candies.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/20.
//

import Foundation

class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        guard let greatestNumber = candies.max() else { return [Bool]() }
        var result = [Bool]()
        for candy in candies {
            if candy + extraCandies >= greatestNumber {
                result.append(true)
            }
            else {
                result.append(false)
            }
        }
        return result
    }
}
