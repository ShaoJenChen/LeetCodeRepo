//
//  55. Jump Game.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/15.
//

import Foundation

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        // [2,3,1,1,4]
        // [3,2,1,0,4]
        //greedy
        var lastIndex = nums.count - 1
        for currentIndex in (0 ..< lastIndex).reversed() {
            if currentIndex + nums[currentIndex] >= lastIndex {
                lastIndex = currentIndex
            }
        }
        //if lastIndex == 0
        // means the original last index, been replaced step by step to 0 index
        return lastIndex == 0
    }
}
