//
//  2336. Smallest Number in Infinite Set.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/14.
//

import Foundation

//Constraints:
//
//1 <= num <= 1000
//At most 1000 calls will be made in total to popSmallest and addBack.

class SmallestInfiniteSet {
    var collections: [Int]
    init() {
        self.collections = Array(1 ... 1000).reversed()
    }
    
    func popSmallest() -> Int {
        let poppedNum = self.collections.removeLast()
        return poppedNum
    }
    
    func addBack(_ num: Int) {
        if self.collections.last! > num && !self.collections.contains(num) {
            self.collections.append(num)
        }
        else if self.collections.last! < num && !self.collections.contains(num){

            var tempCollection = [Int]()
            while self.collections.last! < num {
                tempCollection.append(self.collections.removeLast())
            }
            self.collections.append(num)

            while !tempCollection.isEmpty {
                self.collections.append(tempCollection.removeLast())
            }
            
        }
    }
}

/**
 * Your SmallestInfiniteSet object will be instantiated and called as such:
 * let obj = SmallestInfiniteSet()
 * let ret_1: Int = obj.popSmallest()
 * obj.addBack(num)
 */
