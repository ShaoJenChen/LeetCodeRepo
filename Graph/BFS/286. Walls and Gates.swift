//
//  286. Walls and Gates.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/1.
//

import Foundation

class Solution {
    func wallsAndGates(_ rooms: inout [[Int]]) {
        //1. find all gates
        //2. appdn gete to queue
        //3. BFS calcualte step, rooms will be each step from gate
        let m = rooms.count
        let n = rooms[0].count
        var queue = [(i: Int, j: Int, step: Int)]()

        for i in 0 ..< m {
            for j in 0 ..< n {
                if rooms[i][j] == 0 {
                    queue.append((i, j, 0))
                }
            }
        }
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        
        while !queue.isEmpty {
            let element = queue.removeFirst()
            let current_i = element.i
            let current_j = element.j
            let current_step = element.step
            rooms[current_i][current_j] = current_step

            //append 4 direction - BFS
            let fourDirections = [(current_i - 1, current_j),
                                  (current_i, current_j - 1),
                                  (current_i + 1, current_j),
                                  (current_i, current_j + 1)]

            for direction in fourDirections {
                guard  0 ..< m ~= direction.0 &&  0 ..< n ~= direction.1 else { continue }
                guard rooms[direction.0][direction.1] == 2147483647 else { continue }
                guard visited[direction.0][direction.1] == false else { continue }
                visited[direction.0][direction.1] = true
                queue.append((direction.0, direction.1, current_step + 1))
            }
        }
    }
}
