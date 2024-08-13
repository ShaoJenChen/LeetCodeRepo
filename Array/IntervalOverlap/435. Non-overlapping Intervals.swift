//
//  435. Non-overlapping Intervals.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/12.
//

import Foundation

class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var intervals = intervals.sorted(by: { $0[1] < $1[1] })
        var nonOverlappingIntervals = [[Int]]()
        nonOverlappingIntervals.append(intervals[0])
        var resultCount = 0
        for i in 1 ..< intervals.count {
            let interval = intervals[i]
            let lastNonOverlapInterval = nonOverlappingIntervals.last!
            if interval[0] < lastNonOverlapInterval[1] {
                resultCount += 1
            }
            else {
                nonOverlappingIntervals.append(interval)
            }
        }
        return resultCount
    }
}
