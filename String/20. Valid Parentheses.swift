//
//  20. Valid Parentheses.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation

/**
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 1.Open brackets must be closed by the same type of brackets.
 2.Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.
 */
/**
 Example 1:
 Input: "()"
 Output: true
 
 Example 2:
 Input: "()[]{}"
 Output: true
 
 Example 3:
 Input: "(]"
 Output: false
 
 Example 4:
 Input: "([)]"
 Output: false
 
 Example 5:
 Input: "{[]}"
 Output: true
 */

class Solution {
    func isValid(_ s: String) -> Bool {
        let map = [")": "(", "]": "[", "}": "{"]
        var stack = [Character]()
        var s = Array(s)
        for ch in s {
            if ch == "(" || ch == "[" || ch == "{" { stack.append(ch) }
            if ch == ")" || ch == "]" || ch == "}" {
                guard let top = stack.last else { return false }
                if String(top) == map[String(ch)] {
                    stack.removeLast()
                }
                else {
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
}
