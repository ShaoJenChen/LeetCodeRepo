//
//  346. Moving Average from Data Stream.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/31.
//

import Foundation

class MovingAverage {
    var queue = [Int]()
    var windowSize: Int
    
    init(_ size: Int) {
        self.windowSize = size
    }
    
    func next(_ val: Int) -> Double {
        self.queue.append(val)
        if self.queue.count > windowSize {
            let starIndex = self.queue.count - windowSize
            let endIndex = self.queue.count - 1
            var sum = 0
            for i in starIndex ... endIndex {
                sum += self.queue[i]
            }
            return Double(sum)/Double(windowSize)
        }
        return Double(self.queue.reduce(0,+)) / Double(self.queue.count)
    }
}
