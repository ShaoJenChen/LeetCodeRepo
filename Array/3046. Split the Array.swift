//
//  3046. Split the Array.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/20.
//

import Foundation

class Solution {
    func isPossibleToSplit(_ nums: [Int]) -> Bool {
        let sortedNums = nums.sorted()
        var set1 = Set<Int>()
        var set2 = Set<Int>()
        for i in 0 ..< sortedNums.count {
            let num = sortedNums[i]
            if i % 2 == 0 {
                set1.insert(num)
            }
            else {
                set2.insert(num)
            }
        }
        let validLength = nums.count / 2
        guard set1.count == validLength, set2.count == validLength else { return false }
        return true
    }
}


