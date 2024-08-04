//
//  394. Decode String.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/3.
//

import Foundation

class Solution {
    func decodeString(_ s: String) -> String {
        var s = Array(s)
        var strStack = [String]()
        var kStack = [Int]()
        var number = 0
        var str = ""
        for i in 0 ..< s.count {
            if s[i].isNumber {
                number = number * 10 + Int(String(s[i]))!
            }
            else if s[i] == "[" {
                kStack.append(number)
                strStack.append(str)
                number = 0
                str = ""
            }
            else if s[i] == "]" {
                let k = kStack.removeLast()
                let prevString = strStack.removeLast()
                str = prevString + String(repeating: str, count: k)
            }
            else {
                str += String(s[i])
            }
        }
        return str
    }
}
