//
//  542. 01 Matrix.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/2.
//

import Foundation

//BFS
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var queue = [(i: Int, j: Int, distance: Int)]()
        let m = mat.count
        let n = mat[0].count
        var grid = mat
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        for i in 0 ..< m {
            for j in 0 ..< n {
                if mat[i][j] == 0 {
                    queue.append((i, j, 0))
                    visited[i][j] = true
                }
            }
        }
        
        while !queue.isEmpty {
            let element = queue.removeFirst()
            let i = element.i
            let j = element.j
            let distance = element.distance
            if !visited[i][j] {
                grid[i][j] = distance
                visited[i][j] = true
            }
            let fourDirection: [(i: Int, j: Int)] = [(i, j - 1), (i, j + 1), (i - 1, j), (i + 1, j)]
            for direction in fourDirection {
                guard 0 ..< m ~= direction.i && 0 ..< n ~= direction.j else { continue }
                guard visited[direction.i][direction.j] == false else { continue }
                queue.append((direction.i, direction.j, distance + 1))
            }
        }
        return grid
    }
}
