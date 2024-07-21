//
//  547. Number of Provinces.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/20.
//

import Foundation

class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var visited = Array(repeating: false, count: isConnected.count)
        var province = 0

        //find connected directly or indirectly
        func dfs(_ currentIndex: Int) {
            for index in 0 ..< isConnected.count {
                if isConnected[currentIndex][index] == 1 && visited[index] == false {
                    visited[index] = true
                    dfs(index)
                }
            }
        }

        for i in 0 ..< isConnected.count {
            if visited[i] == false {
                province += 1
                dfs(i)
            }
        }
        return province
    }

