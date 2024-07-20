//
//  1137. N-th Tribonacci Number.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/19.
//

import Foundation

class Solution {
    func tribonacci(_ n: Int) -> Int {

        if n == 0 { return 0 }
        if n == 1 || n == 2 { return 1 }

        //Tn = Tn-3 + Tn-2 + Tn-1
        var tribonacciArry = Array(repeating: 0, count: n + 1)
        tribonacciArry[1] = 1
        tribonacciArry[2] = 1

        for i in 3 ... n {
            tribonacciArry[i] = tribonacciArry[i - 3] + tribonacciArry[i - 2] + tribonacciArry[i - 1]
        }
        
        return tribonacciArry[n]
    }
}
