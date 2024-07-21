//
//  3. Longest Substring Without Repeating Characters.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/21.
//

import Foundation


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var left = 0
        var right = 0
        var strArr = Array(s)
        var map = [String: Int]()
        var maxCount = 0
        while right < strArr.count {
            let c = strArr[right]
            if let previousIndex = map[String(c)] {
                left = max(left, previousIndex + 1)
            }
            map[String(c)] = right
            maxCount = max(maxCount, right - left + 1)
            right += 1
        }
        return maxCount
    }
}
