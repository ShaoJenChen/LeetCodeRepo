//
//  5. Longest Palindromic Substring.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/11.
//

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> String {
        var s = Array(s)
        var longestSubStr = ""

        func expand(_ left: Int, _ right: Int) {
            var left = left
            var right = right
            while left >= 0, right < s.count, s[left] == s[right] {
                left -= 1
                right += 1
            }
            let latestValidLeft = left + 1
            let latestValidRight = right - 1
            let validLength = latestValidRight - latestValidLeft + 1
            guard 0 ..< s.count ~= latestValidLeft, 0 ..< s.count ~= latestValidRight,
                latestValidLeft <= latestValidRight else { return }
                
            if validLength > longestSubStr.count {
                longestSubStr = String(s[latestValidLeft ... latestValidRight])
            }
        }

        for i in 0 ..< s.count {
            expand(i, i)
            expand(i, i + 1)
        }
        return longestSubStr
    }
}

class Solution {
    func longestPalindrome(_ s: String) -> String {
        var s = Array(s)
        var resultStr = ""

        for i in 0 ..< s.count {
            expand(left: i, right: i)
            expand(left: i, right: i + 1)
        }

        func expand(left: Int, right: Int) {
            var left = left
            var right = right
            while left >= 0 && right < s.count && s[left] == s[right] {
                left -= 1
                right += 1
            }
            left += 1
            right -= 1
            if resultStr.count < right - left + 1 {
                resultStr = String(s[left ... right])
            }
        }

        return resultStr
    }
}
