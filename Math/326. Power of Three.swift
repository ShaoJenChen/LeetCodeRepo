//
//  326. Power of Three.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2021/1/27.
//

//Given an integer n, return true if it is a power of three. Otherwise, return false.
//
//An integer n is a power of three, if there exists an integer x such that n == 3x.
//
//
//
//Example 1:
//
//Input: n = 27
//Output: true
//Example 2:
//
//Input: n = 0
//Output: false
//Example 3:
//
//Input: n = 9
//Output: true
//Example 4:
//
//Input: n = 45
//Output: false
//
//
//Constraints:
//
//-231 <= n <= 231 - 1

import Foundation

class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        func log3(val: Double) -> Double {
            return log10(val)/log10(3.0)
        }
        let log3Value = log3(val: Double(n))
        let remainderValue = log3Value.truncatingRemainder(dividingBy: 1)
        if remainderValue != 0 {
            return false
        }
        return true
    }
}
