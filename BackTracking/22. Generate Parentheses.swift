//
//  22. Generate Parentheses.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/10.
//

//Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
//
// 
//
//Example 1:
//
//Input: n = 3
//Output: ["((()))","(()())","(())()","()(())","()()()"]
//Example 2:
//
//Input: n = 1
//Output: ["()"]
// 
//
//Constraints:
//
//1 <= n <= 8

import Foundation

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        var tmp = ""

        func backTrack(_ left: Int, _ right: Int) {
            if left == 0 && right == 0 {
                result.append(tmp)
            }
            if left > 0 {
                tmp.append("(")
                backTrack(left - 1, right)
                tmp.removeLast()
            }
            if right > left {
                tmp.append(")")
                backTrack(left, right - 1)
                tmp.removeLast()
            }
        }
        backTrack(n, n)
        return result
    }
}
