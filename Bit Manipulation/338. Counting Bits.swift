//
//  338. Counting Bits.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/13.
//

import Foundation


class Solution {
    func countBits(_ n: Int) -> [Int] {
        var result = [Int]()
        for num in 0 ... n {
            let binaryRep = String(num, radix: 2)
            let count_one = binaryRep.filter({ $0 == "1" }).count
            result.append(count_one)
        }
        return result
    }
}
