//
//  340. Longest Substring with At Most K Distinct Characters.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/10.
//

import Foundation

class Solution {
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        var left = 0
        var right = 0
        var charMap = [Character: Int]()
        var s = Array(s)
        var maxLength = 0
        while right < s.count {
            let readedChar = s[right]
            charMap[readedChar, default: 0] += 1
            
            while charMap.count > k {
                let leftChar = s[left]
                charMap[leftChar]! -= 1
                if charMap[leftChar] == 0 {
                    charMap.removeValue(forKey: leftChar)
                }
                left += 1
            }

            maxLength = max(maxLength, right - left + 1)
            right += 1
        }
        return maxLength
    }
}
