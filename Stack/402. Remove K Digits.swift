//
//  402. Remove K Digits.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/11.
//

//Given string num representing a non-negative integer num, and an integer k, return the smallest possible integer after removing k digits from num.
//
// 
//
//Example 1:
//
//Input: num = "1432219", k = 3
//Output: "1219"
//Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
//Example 2:
//
//Input: num = "10200", k = 1
//Output: "200"
//Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
//Example 3:
//
//Input: num = "10", k = 2
//Output: "0"
//Explanation: Remove all the digits from the number and it is left with nothing which is 0.
// 
//
//Constraints:
//
//1 <= k <= num.length <= 105
//num consists of only digits.
//num does not have any leading zeros except for the zero itself.

import Foundation

class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var stack = ""
        var num = num
        var k = k
        if k == num.count { return "0" }

        for digit in num {
            
            while (!stack.isEmpty && digit < stack.last! && k > 0) {
                k -= 1
                stack.removeLast()
            }

            if stack.isEmpty && digit == "0" { continue }

            stack.append(digit)
        }
        
        while (k > 0 && !stack.isEmpty) {
            k -= 1
            stack.removeLast()
        }

        if stack.isEmpty { return "0" }

        return stack
    }
}
