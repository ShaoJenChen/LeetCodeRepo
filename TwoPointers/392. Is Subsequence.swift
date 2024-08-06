//
//  392. Is Subsequence.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/5.
//

import Foundation


class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard !s.isEmpty else { return true }
        guard !t.isEmpty else { return false }
        var s = Array(s)
        var t = Array(t)
        var sPointer = 0
        var tPointer = 0
        while tPointer < t.count {
            if t[tPointer] == s[sPointer] {
                sPointer += 1
                if sPointer == s.count { return true }
            }
            tPointer += 1
        }
        return false
    }
}
