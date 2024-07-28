//
//  3110. Score of a String.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/27.
//

import Foundation

class Solution {
    func scoreOfString(_ s: String) -> Int {
        var s = Array(s)
        var result = 0
        for i in 0 ..< s.count - 1 {
            let score = abs(Int(s[i].asciiValue!) - Int(s[i + 1].asciiValue!))
            result += score
        }
        return result
    }
}
