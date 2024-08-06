//
//  1456. Maximum Number of Vowels in a Substring of Given Length.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/5.
//

import Foundation

class Solution {
    func maxVowels(_ s: String, _ k: Int) -> Int {
        var s = Array(s)
        let vowels = ["a","e","i","o","u"]
        var left = 0
        var right = 0
        var maxVowCount = 0
        var currentCount = 0
        while right < s.count {
            let currentChar = s[right]
            if vowels.contains(String(currentChar)) {
                currentCount += 1
                maxVowCount = max(maxVowCount, currentCount)
            }
            if right - left + 1 == k {
                let leftChar = s[left]
                if vowels.contains(String(leftChar)) {
                    currentCount -= 1
                }
                left += 1
            }
            right += 1
        }
        return maxVowCount
    }
}
