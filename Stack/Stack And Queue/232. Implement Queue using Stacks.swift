//
//  232. Implement Queue using Stacks.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/2.
//

import Foundation


//Implement a first in first out (FIFO) queue using only two stacks. The implemented queue should support all the functions of a normal queue

class MyQueue {

    private var lstack = [Int]()
    private var rstack = [Int]()

    init() {}
    
    func push(_ x: Int) {
        lstack.append(x)
    }
    
    func pop() -> Int {
        if !rstack.isEmpty {
            return rstack.removeLast()
        }
        else {
            while !lstack.isEmpty { rstack.append(lstack.removeLast()) }
        }
        return rstack.removeLast()
    }
    
    func peek() -> Int {
        if !rstack.isEmpty {
            return rstack.last!
        }
        else {
            while !lstack.isEmpty { rstack.append(lstack.removeLast()) }
        }
        return rstack.last!
    }
    
    func empty() -> Bool {
        return rstack.isEmpty && lstack.isEmpty
    }
}
