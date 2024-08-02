//
//  150. Evaluate Reverse Polish Notation.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/2.
//

import Foundation

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for ch in tokens {
            if !"+-*/".contains(ch) {
                stack.append(Int(ch)!)
                continue
            }
            let number2 = stack.popLast()!
            let number1 = stack.popLast()!
            var result = 0
            switch ch {
                case "+":
                result = number1 + number2
                case "-":
                result = number1 - number2
                case "*":
                result = number1 * number2
                case "/":
                result = number1 / number2
                default:
                break
            }
            stack.append(result)
        }
        return stack.popLast()!
    }
}
