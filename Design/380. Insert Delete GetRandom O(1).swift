//
//  380. Insert Delete GetRandom O(1).swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/8.
//

import Foundation

//boring problem in Swift
class RandomizedSet {

    var numberSet = Set<Int>()

    init() {
    }
    
    func insert(_ val: Int) -> Bool {
        let (inserted, member) = numberSet.insert(val)
        return inserted
    }
    
    func remove(_ val: Int) -> Bool {
        if let element = numberSet.remove(val) { return true }
        return false
    }
    
    func getRandom() -> Int {
        let element: Int! = numberSet.randomElement()
        return element

    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
