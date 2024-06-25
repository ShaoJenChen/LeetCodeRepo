//
//  823. Binary Trees With Factors.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/11.
//

//Given an array of unique integers, arr, where each integer arr[i] is strictly greater than 1.
//
//We make a binary tree using these integers, and each number may be used for any number of times. Each non-leaf node's value should be equal to the product of the values of its children.
//
//Return the number of binary trees we can make. The answer may be too large so return the answer modulo 109 + 7.
//
// 
//
//Example 1:
//
//Input: arr = [2,4]
//Output: 3
//Explanation: We can make these trees: [2], [4], [4, 2, 2]
//Example 2:
//
//Input: arr = [2,4,5,10]
//Output: 7
//Explanation: We can make these trees: [2], [4], [5], [10], [4, 2, 2], [10, 2, 5], [10, 5, 2].
// 
//
//Constraints:
//
//1 <= arr.length <= 1000
//2 <= arr[i] <= 109
//All the values of arr are unique.

import Foundation

class Solution {
    func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
        let arr = arr.sorted()
        let modulo_num = 1_000_000_007

        var dp = [Int: Int]()

        for i in 0 ..< arr.count {

            dp[arr[i]] = 1

            for j in 0 ..< i where arr[i] % arr[j] == 0 {

                dp[arr[i], default: Int(0)] += dp[arr[j], default: 0] * dp[arr[i] / arr[j], default: 0]

            }
        }
        return dp.values.reduce(0, +) % modulo_num
    }
}
