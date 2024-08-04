//
//  151. Reverse Words in a String.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/13.
//

import Foundation


class Solution {
    func reverseWords(_ s: String) -> String {
        var components = s.components(separatedBy: .whitespacesAndNewlines)
        components = components.filter({ !$0.isEmpty })

        var reversedComponents = components.reversed()
        var result = reversedComponents.reduce("", { $0 + " " + $1 })

        result.removeFirst()

        return result
    }
}

//Queue
class Solution {
    func reverseWords(_ s: String) -> String {
        let s = Array(s)
        var queue = [Character]()
        var splitedStr = [String]()
        for i in 0 ..< s.count {
            guard s[i].isLetter || s[i].isNumber else {
                if !queue.isEmpty {
                    splitedStr.insert(String(queue), at: 0)
                    queue.removeAll()
                }
                continue
            }
            queue.append(s[i])
        }
        if !queue.isEmpty {
            splitedStr.insert(String(queue), at: 0)
        }
        var resultStr = splitedStr.reduce("", { $0 + " " + $1})
        resultStr.removeFirst()
        return resultStr
    }
}
