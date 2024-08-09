//
//  62. Unique Paths.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/19.
//

import Foundation

//DP Bottom-up
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        // dp[i][j] = dp[i-1][j] + dp[i][j-1]
        //bottom up
        // base case => dp[i][j] where i == 0 or j == 0 equal 1
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0 ..< m {
            for j in 0 ..< n {
                if i == 0 || j == 0 { dp[i][j] = 1 }
                else {
                    dp[i][j] = dp[i-1][j] + dp[i][j-1]
                }
            }
        }
        return dp[m-1][n-1]
    }
}

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        //m n -> 1. form top 2. from left
        //path(m, n) = path(m - 1, n) + path(m, n - 1)
        // m, n = 0 -> return 1

        var map = [String: Int]()

        func dp(_ m: Int, _ n: Int) -> Int {
            
            if m == 0 || n == 0 { return 1 }

            if let value = map["\(m)x\(n)"] { return value }

            var paths = dp(m - 1, n) + dp(m, n - 1)
            
            map["\(m)x\(n)"] = paths

            return paths
        }
        
        return dp(m - 1, n - 1)
    }
}
