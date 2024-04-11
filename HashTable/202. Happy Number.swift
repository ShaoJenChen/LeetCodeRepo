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
    
    func isHappy(_ n: Int) -> Bool {
        var n = n
        while n > 9 {
            n = String(n).compactMap { Int(String($0)) }.reduce(0) { $0 + $1 * $1 }
        }
        return n == 1 || n == 7 ? true : false
    }
    
//    It will finally goto a
//    4→16→37→58→89→145→42→20→4 loop.
//    so just consider if go to one of these number, it will be not happy number, otherwise, it will finally stop at 1
//    Single digit numbers apart from 1 and 7, are not happy numbers.
//    So if n==1 or n==7 then directly return true.
//    Otherwise, run the loop until n>9, i.e. when the number of digits are greater than 1.
//    Inside this main loop, access individual digits of the number(n) and perform the square operation followed by sum.
//    This sum if equals to either 1 or 7, then we can return true. Else continue the loop, untill the sum becomes a single digit number.
//    Lastly, if 1 or 7 doesnot appear, then return false.
}
