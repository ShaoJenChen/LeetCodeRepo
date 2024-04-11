//
//  528. Random Pick with Weight.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/9.
//

//You are given a 0-indexed array of positive integers w where w[i] describes the weight of the ith index.
//
//You need to implement the function pickIndex(), which randomly picks an index in the range [0, w.length - 1] (inclusive) and returns it. The probability of picking an index i is w[i] / sum(w).
//
//For example, if w = [1, 3], the probability of picking index 0 is 1 / (1 + 3) = 0.25 (i.e., 25%), and the probability of picking index 1 is 3 / (1 + 3) = 0.75 (i.e., 75%).


import Foundation


class Solution {

    var indexArr = [Int]()

    init(_ w: [Int]) {

        let sum = Double(w.reduce(0, +))
        
        for (index, value) in w.enumerated() {
            let percentCount = Int(Double(value) / sum * 100)
            
            let indexSequence = [Int](repeating: index, count: percentCount)

            indexArr.append(contentsOf: indexSequence)
            
        }
    }
    
    func pickIndex() -> Int {
        if indexArr.isEmpty { return 0 }
        return indexArr.randomElement()!
    }

}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(w)
 * let ret_1: Int = obj.pickIndex()
 */
