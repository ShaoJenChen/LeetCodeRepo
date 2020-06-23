//
//  371. Sum of Two Integers.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.

 Example 1:
 Input: a = 1, b = 2
 Output: 3
 
 Example 2:
 Input: a = -2, b = 3
 Output: 1
 */
class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        if a == 0 { return b }
        if b == 0 { return a }
        return getSum(a ^ b, (a & b) << 1)
    }
}
