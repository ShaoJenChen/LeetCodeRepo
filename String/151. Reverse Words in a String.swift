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
