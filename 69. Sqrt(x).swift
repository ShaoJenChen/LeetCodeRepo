//
//  69. Sqrt(x).swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation
/**
 Implement int sqrt(int x).

 Compute and return the square root of x, where x is guaranteed to be a non-negative integer.

 Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.
 */
/**
 Example 1:
 Input: 4
 Output: 2
 
 Example 2:
 Input: 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since
              the decimal part is truncated, 2 is returned.
 */
class Solution {
    func mySqrt(_ x: Int) -> Int {
        var left = 1
        var right = x
        while left <= right {
            let mid = Int((left + right)/2)
            if mid * mid > x {
                right = mid - 1
            }
            else if mid * mid < x {
                left = mid + 1
            }
            else {
                return mid
            }
        }
        return right
    }
}
