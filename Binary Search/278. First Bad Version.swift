//
//  278. First Bad Version.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/19.
//

import Foundation

/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n
        while left < right {
            let mid = (left+right)/2
            if !isBadVersion(mid) {
                left = mid + 1
            }
            else {
                right = mid
            }
        }
        return right
    }
}
