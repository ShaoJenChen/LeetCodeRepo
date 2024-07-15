//
//  1207. Unique Number of Occurrences.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/15.
//

import Foundation

class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var map = [Int: Int]()
        for num in arr {
            map[num, default: 0] += 1
        }
        
        var occurrenceSet = Set<Int>()
        for occurrence in map.values {
            let (insetResult, _) = occurrenceSet.insert(occurrence)
            if insetResult == false { return false }
        }

        return true
    }
}
