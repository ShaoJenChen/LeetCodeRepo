//
//  139. Word Break.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/8.
//

import Foundation

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var s = Array(s)
        var dp = Array(repeating: false, count: s.count + 1)
        dp[0] = true
        
        for i in 1 ... s.count {
            for j in 0 ..< i {
                let range = j ..< i
                let subString = String(s[range])
                
                if wordDict.contains(subString) && dp[j] == true {
                    dp[i] = true
                    break
                }
            }
        }
        
        return dp.last!
    }
}

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var s = Array(s)
        var dp = Array(repeating: false, count: s.count + 1)
        dp[0] = true

        for i in 0 ..< s.count {
            for j in 0 ... i {
                let range = j ... i
                let subString = String(s[range])
                if wordDict.contains(subString) && dp[j] == true {
                    dp[i + 1] = true
                }
            }
        }
        return dp.last!
    }
}
