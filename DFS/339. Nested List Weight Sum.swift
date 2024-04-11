//
//  339. Nested List Weight Sum.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/4/9.
//

//You are given a nested list of integers nestedList. Each element is either an integer or a list whose elements may also be integers or other lists.
//
//The depth of an integer is the number of lists that it is inside of. For example, the nested list [1,[2,2],[[3],2],1] has each integer's value set to its depth.
//
//Return the sum of each integer in nestedList multiplied by its depth.

import Foundation

/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
class Solution {
    var sum = 0
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        var depth = 1
        for list in nestedList {
            if list.isInteger() {
                sum += list.getInteger() * depth
            }
        else {
                let nextNestedList = list.getList()
                dfs(nextNestedList, depth: depth + 1)
            }
        }
        return sum
    }
    func dfs(_ nestedList: [NestedInteger], depth: Int) {
        for list in nestedList {
            if list.isInteger() {
                sum += list.getInteger() * depth
            }
        else {
                let nextNestedList = list.getList()
                dfs(nextNestedList, depth: depth + 1)
            }
        }
    }

}
