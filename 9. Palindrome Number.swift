//
//  9.Palindrome Number.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

//Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
//
//Example 1:
//Input: 121
//Output: true
//
//Example 2:
//Input: -121
//Output: false
//
//Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.

import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {

        if x < 0 {
            return false
        }

        var digits = [Int]()
    
        var input = x
    
        while ( input / 10 != 0 ) {

             let digit = input % 10

            digits.append(digit)

            input = input / 10
        }
    
        digits.append(input)
        
        var reverseResult = 0.0
    
        for (index,digit) in digits.enumerated() {
        
            reverseResult += Double(digit) * pow(10.0,Double(digits.count - index-1))
        
        }
        
        return Int(reverseResult) == x ? true : false
        
    }
}
