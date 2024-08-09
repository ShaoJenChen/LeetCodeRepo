//
//  70. Climbing Stairs.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 You are climbing a stair case. It takes n steps to reach to the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

 Note: Given n will be a positive integer.
 */
/**
 Example 1:
 Input: 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 
 Example 2:
 Input: 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
 */

class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 0 || n == 1 { return 1 }
        var distinctWays = [1, 1]
        
        for i in 2...n {
            distinctWays.append(distinctWays[i-1] + distinctWays[i-2])
        }
        return distinctWays[n]
    }
}

//DP
class Solution {
    func climbStairs(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        if n < 2 { return dp[n] }
        for i in 2 ... n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
}

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var map = [Int: Int]()
        func dp(_ n: Int) -> Int {
            if n == 1 || n == 0 {
                return 1
            }
            if let value = map[n] { return value }

            let result = dp(n - 1) + dp(n - 2)
            map[n] = result
            return result
        }
        return dp(n)
    }
}
