//
//  263. Ugly Number.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2022/3/15.
//

//An ugly number is a positive integer whose prime factors are limited to 2, 3, and 5.
//
//Given an integer n, return true if n is an ugly number.
//
//
//
//Example 1:
//Input: n = 6
//Output: true
//Explanation: 6 = 2 × 3

//Example 2:
//Input: n = 1
//Output: true
//Explanation: 1 has no prime factors, therefore all of its prime factors are limited to 2, 3, and 5.

//Example 3:
//Input: n = 14
//Output: false
//Explanation: 14 is not ugly since it includes the prime factor 7.
//
//Constraints:
//-231 <= n <= 231 - 1

import Foundation

class Solution {
    func isUgly(_ n: Int) -> Bool {
        
        var number = n
        
        while (number > 1) {
            if number % 2 == 0 {
                number = number / 2
            }
            else if number % 3 == 0 {
                number = number / 3
            }
            else if number % 5 == 0 {
                number = number / 5
            }
            else {
                return false
            }
        }
        if number == 1 {
            return true
        }
        else {
            return false
        }
    }
}
