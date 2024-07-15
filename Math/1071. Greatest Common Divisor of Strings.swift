//
//  1071. Greatest Common Divisor of Strings.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/15.
//

import Foundation

class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        //最大公因數，輾轉相除法
        func gcd(x: Int, y: Int) -> Int {
            if y == 0 {
                return x
            } else {
                return gcd(x: y, y: x % y)
            }
        }

        //兩個string 順序相反的相加也可以等於 才表示有最大公因數的substring
        if str1 + str2 != str2 + str1 { return "" }
        
        //將兩個字串的長度求出最大公因數
        let gcdLength = gcd(x: str1.count, y: str2.count)
        
        //用最大公因數的長度取出隨便一個string的prefix
        return String(str1.prefix(gcdLength))
    }
}
