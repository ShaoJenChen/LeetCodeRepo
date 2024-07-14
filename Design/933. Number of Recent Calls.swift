//
//  933. Number of Recent Calls.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/13.
//

import Foundation


class RecentCounter {

    var queue = [Int]()
    init() {
    }
    
    func ping(_ t: Int) -> Int {
        self.queue.append(t)
        let range = t - 3000 ... t
        return queue.filter({ $0 >= range.lowerBound && $0 <= range.upperBound }).count
    }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */
