//
//  2390. Removing Stars From a String.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/13.
//

import Foundation

class Solution {
    func removeStars(_ s: String) -> String {
        var stack = [String]()
        for c in s {
            if c.isLetter {
                stack.append(String(c))
            }
            else {
                stack.removeLast()
            }
        }
        return stack.reduce("", {$0 + $1})
    }
}
