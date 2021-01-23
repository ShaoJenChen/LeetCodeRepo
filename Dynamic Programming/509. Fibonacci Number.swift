//
//  509. Fibonacci Number.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2021/1/23.
//


//The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,
//
//F(0) = 0, F(1) = 1
//F(n) = F(n - 1) + F(n - 2), for n > 1.
//Given n, calculate F(n).
//
//
//
//Example 1:
//
//Input: n = 2
//Output: 1
//Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
//Example 2:
//
//Input: n = 3
//Output: 2
//Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.
//Example 3:
//
//Input: n = 4
//Output: 3
//Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.
//
//
//Constraints:
//
//0 <= n <= 30

import Foundation

//Runtime: 0 ms, faster than 100.00% of Swift online submissions for Fibonacci Number.
class Solution {
    
    var map = [Int:Int]()
    
    func fib(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 { return 1 }
        if let calculatedValue = map[n] {
            return calculatedValue
        }
        map[n] = fib(n-1) + fib(n-2)
        return map[n]!
    }
}
