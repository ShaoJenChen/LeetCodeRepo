//
//  3032. Count Numbers With Unique Digits II.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/21.
//

import Foundation


class Solution {
    func numberCount(_ a: Int, _ b: Int) -> Int {

        func isUnique(_ n: Int) -> Bool {
            var digitArr = [Int]()
            var n = n
            while n != 0 {
                var digit = n % 10
                digitArr.append(digit)
                n /= 10
            }
            let uniqueSet = Set(digitArr)
            return uniqueSet.count == digitArr.count
        }
        
        func dp(_ n: Int) -> Int {
            if n < a { return 0 }
            if isUnique(n) {
                return 1 + dp(n - 1)
            }
            else {
                return dp(n - 1)
            }
        }
        return dp(b)
    }
}
