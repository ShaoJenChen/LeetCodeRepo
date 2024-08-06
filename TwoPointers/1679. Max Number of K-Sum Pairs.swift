//
//  1679. Max Number of K-Sum Pairs.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/5.
//

import Foundation

class Solution {
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var sortedNums = nums.sorted()
        var leftPointer = 0
        var rightPointer = nums.count - 1
        while leftPointer < rightPointer {
            let sum = sortedNums[leftPointer] + sortedNums[rightPointer]
            if sum == k {
                count += 1
                leftPointer += 1
                rightPointer -= 1
            }
            if sum > k {
                rightPointer -= 1
            }
            if sum < k {
                leftPointer += 1
            }
        }
        
        return count
    }
}
