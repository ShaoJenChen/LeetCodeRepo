//
//  7.Reverse Integer.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

//Given a 32-bit signed integer, reverse digits of an integer.
//
//Example 1:
//Input: 123
//Output: 321
//
//Example 2:
//Input: -123
//Output: -321
//
//Example 3:
//Input: 120
//Output: 21

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
    
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
        
        return Int(reverseResult) > Int32.min && Int(reverseResult) < Int32.max ? Int(reverseResult) : 0
    }
}
