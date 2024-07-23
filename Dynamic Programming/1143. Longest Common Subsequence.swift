//
//  1143. Longest Common Subsequence.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/23.
//

import Foundation


class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let str1 = Array(text1)
        let str2 = Array(text2)
        var map = [String: Int]()

        func dp(_ i: Int, _ j: Int) -> Int {
            if i >= str1.count || j >= str2.count { return 0 }
            if let value = map["i:\(i),j:\(j)"] { return value}

            if str1[i] == str2[j] {
                let value = 1 + dp(i + 1, j + 1)
                map["i:\(i),j:\(j)", default: 0] = value
                return value
            }
            else {
                let value = max(dp(i + 1, j), dp(i, j + 1) )
                map["i:\(i),j:\(j)", default: 0] = value
                return value
            }
        }
        return dp(0, 0)
    }
}


class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let str1 = Array(text1)
        let str2 = Array(text2)

        var col = Array(repeating: 0, count: str2.count + 1)
        var dp = Array(repeating: col, count: str1.count + 1)

        for i in 1 ... str1.count {
            for j in 1 ... str2.count {
                if str1[i - 1] == str2[j - 1] {
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                }
                else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[str1.count][str2.count]
    }
}
