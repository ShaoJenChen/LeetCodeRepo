//
//  739. Daily Temperatures.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/2.
//

import Foundation

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var answers = Array(repeating: 0, count: temperatures.count)
        var stack = [(temp: Int, index: Int)]()
        stack.append((temperatures[0], 0))
        for i in 1 ..< temperatures.count {
            while !stack.isEmpty {
                guard let top = stack.popLast() else { continue }
                if temperatures[i] > top.temp {
                    answers[top.index] = i - top.index
                }
                else {
                    stack.append(top)
                    break
                }
            }
            stack.append((temperatures[i], i))
        }
        return answers
    }
}
