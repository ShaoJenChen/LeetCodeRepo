//
//  1004. Max Consecutive Ones III.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/5.
//

import Foundation


class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var left = 0
        var right = 0
        var maxConsecutiveOnes = 0
        var numOfZero = 0
        let limitOfZero = k

        while right < nums.count {
            if nums[right] == 0 {
                numOfZero += 1
            }
            while numOfZero > limitOfZero {
                if nums[left] == 0 {
                    left += 1
                    numOfZero -= 1
                }
                else {
                    left += 1
                }
            }

            maxConsecutiveOnes = max(maxConsecutiveOnes, right - left + 1)
            right += 1
        }

        return maxConsecutiveOnes
    }
}
