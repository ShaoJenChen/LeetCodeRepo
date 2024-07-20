//
//  443. String Compression.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/16.
//

import Foundation

class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        var count = 1
        var result = String()
        for index in 1 ..< chars.count {
            if chars[index] == chars[index - 1] {
                count += 1
            } else {
                result += String(chars[index - 1])
                if count > 1 {
                    result += String(count)
                    count = 1
                }
            }
        }
        result += String(chars.last!)
        if count > 1 {
            result += String(count)
            count = 1
        }
        chars = Array(result)
        return chars.count
    }
}
