//
//  202. Happy Number.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2021/1/20.
//

import Foundation


//Write an algorithm to determine if a number n is happy.
//
//A happy number is a number defined by the following process:
//
//Starting with any positive integer, replace the number by the sum of the squares of its digits.
//Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
//Those numbers for which this process ends in 1 are happy.
//Return true if n is a happy number, and false if not.
//
//
//
//Example 1:
//
//Input: n = 19
//Output: true
//Explanation:
//1^2 + 9^2 = 82
//8^2 + 2^2 = 68
//6^2 + 8^2 = 100
//1^2 + 0^2 + 0^2 = 1
//
//
//Example 2:
//
//Input: n = 2
//Output: false
//
//
//Constraints:
//
//1 <= n <= 2^31 - 1


class Solution {
    
    //use Set because check contains only O(1)
    var caculatedNumber: Set<Int> = []
    
    func isHappy(_ n: Int) -> Bool {
        
        if n == 1 { return true }
        
        if self.caculatedNumber.contains(n) { return false }
        
        self.caculatedNumber.insert(n)
        
        var nowNumber = n
        var nextNumber = 0
        while nowNumber != 0{
            
            let digit = nowNumber % 10
            nextNumber += digit * digit
            
            nowNumber = nowNumber / 10
        }
        
        return isHappy(nextNumber)
    }
}
