//
//  171. Excel Sheet Column Number.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2021/1/26.
//
//Given a column title as appear in an Excel sheet, return its corresponding column number.
//
//For example:
//
//    A -> 1
//    B -> 2
//    C -> 3
//    ...
//    Z -> 26
//    AA -> 27
//    AB -> 28
//    ...
//Example 1:
//
//Input: "A"
//Output: 1
//Example 2:
//
//Input: "AB"
//Output: 28
//Example 3:
//
//Input: "ZY"
//Output: 701
//
//
//Constraints:
//
//1 <= s.length <= 7
//s consists only of uppercase English letters.
//s is between "A" and "FXSHRXW".

import Foundation

class Solution {
    func titleToNumber(_ s: String) -> Int {
        var tempStrings = s
        var map = [String: Int]()
        var value = 1
        for asciiCode in 65 ... 90 {
            map[String(UnicodeScalar(asciiCode)!)] = value
            value += 1
        }
        
        var stringLength = s.count
        var result = 0
        while stringLength > 0 {
            let currentChar = tempStrings.removeFirst()
            var currentCharValue: Int! = map[String(currentChar)]
            
            var powerCount = tempStrings.count
            while powerCount > 0 {
                currentCharValue *= 26
                powerCount -= 1
            }
            result += currentCharValue
            stringLength -= 1
        }
        return result
    }
}

