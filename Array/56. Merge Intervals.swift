//
//  56. Merge Intervals.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2022/3/20.
//

//Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.
//
//
//
//Example 1:
//
//Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
//Output: [[1,6],[8,10],[15,18]]
//Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
//Example 2:
//
//Input: intervals = [[1,4],[4,5]]
//Output: [[1,5]]
//Explanation: Intervals [1,4] and [4,5] are considered overlapping.
//
//
//Constraints:
//
//1 <= intervals.length <= 104
//intervals[i].length == 2
//0 <= starti <= endi <= 104

import Foundation

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let sortedIntervals = intervals.sorted(by: { $0[0] < $1[0] })
        var mergedIntervals = [[Int]]()
        mergedIntervals.append(sortedIntervals[0])
        for i in 1 ..< sortedIntervals.count {
            let lastMergedInterval = mergedIntervals.last!
            let currentInterval = sortedIntervals[i]
            if currentInterval[0] <= lastMergedInterval[1] {
                let lastIndex = mergedIntervals.count - 1
                let newRightBoundry = max(mergedIntervals[lastIndex][1], currentInterval[1])
                mergedIntervals[lastIndex][1] = newRightBoundry
            }
            else {
                mergedIntervals.append(currentInterval)
            }
        }
        return mergedIntervals
    }
}


class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        
        let sortArr = intervals.sorted(by: {
            $0.first! < $1.first!
        })
        var result = [[Int]]()
        
        for interval in sortArr {
            
            if result.isEmpty || result.last![1] < interval[0] {
                result.append(interval)
            }
            else {
                result[result.count - 1][1] = max(result.last![1], interval[1])
            }
        }
        
        return result
    }
}
