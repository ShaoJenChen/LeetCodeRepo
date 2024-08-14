//
//  875. Koko Eating Bananas.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/13.
//

import Foundation

class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        // eat  1...k / per hour
        // return min k, we have h hour
        // target to eat all of piles
        var left = 1
        var right = piles.max()!
        var mid = (right + left)/2

        while left < right {
            mid = (right + left)/2
            var allNeedHours = 0
            for pile in piles {
                let currentPileHour = Int(ceil(Double(pile)/Double(mid)))
                allNeedHours += currentPileHour
            }
            if allNeedHours > h {
                left = mid + 1
            }
            else {
                right = mid
            }
        }
        return right
    }
}
