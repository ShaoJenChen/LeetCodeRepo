//
//  622. Design Circular Queue.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/31.
//

import Foundation

class MyCircularQueue {
    var head: Int = 0
    var tail: Int = 0
    var cir_queue: [Int]
    let k: Int
    
    init(_ k: Int) {
        self.cir_queue = Array(repeating: -1, count: k)
        self.k = k
    }
    
    func enQueue(_ value: Int) -> Bool {
        if isFull() { return false }
        cir_queue[tail] = value
        tail += 1
        tail %= k
        return true
    }
    
    func deQueue() -> Bool {
        if isEmpty() { return false }
        cir_queue[head] = -1
        head += 1
        head %= k
        return true
    }
    
    func Front() -> Int {
        return cir_queue[head]
    }
    
    func Rear() -> Int {
        let tailIndex = tail - 1 < 0 ? k - 1 : tail - 1
        return cir_queue[tailIndex]
    }
    
    func isEmpty() -> Bool {
        return head == tail && cir_queue[head] == -1
    }
    
    func isFull() -> Bool {
        return head == tail && cir_queue[head] != -1
    }
}
