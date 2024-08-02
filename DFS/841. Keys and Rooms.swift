//
//  841. Keys and Rooms.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/15.
//

import Foundation

//DFS
class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var stack = [Int]()
        var visited = Array(repeating: false, count: rooms.count)
        visited[0] = true
        stack.append(contentsOf: rooms[0])

        while !stack.isEmpty {
            let key = stack.popLast()!
            guard visited[key] == false else { continue }
            stack.append(contentsOf: rooms[key])
            visited[key] = true
        }
        return !visited.contains(false)
    }
}

//BFS
class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var queue = [Int]()
        var visited = Array(repeating: false, count: rooms.count)
        visited[0] = true
        queue.append(contentsOf: rooms[0])

        while !queue.isEmpty {
            let key = queue.removeFirst()
            guard visited[key] == false else { continue }
            visited[key] = true
            
            for nextKey in rooms[key] {
                guard visited[nextKey] == false else { continue }
                visited[nextKey] = true
                queue.append(contentsOf: rooms[nextKey])
            }

        }
        return !visited.contains(false)
    }
}

class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var keyPool = [Int]()
        var roomIsUnlocked = [true]
        roomIsUnlocked.append(contentsOf: repeatElement(false, count: rooms.count - 1))

        keyPool.append(contentsOf: rooms[0])

        while !keyPool.isEmpty {
            for (index, roomKeys) in rooms.enumerated() {
                guard roomIsUnlocked[index] == false else { continue }
                
                if keyPool.contains(index) {
                    keyPool.removeAll(where: { $0 == index })
                    roomIsUnlocked[index] = true
                    keyPool.append(contentsOf: roomKeys)
                }
            }
            //check unuse key
            if let lastKey = keyPool.popLast() {
                if roomIsUnlocked[lastKey] == false {
                    keyPool.insert(lastKey, at: 0)
                }
            }
        }
        return !roomIsUnlocked.contains(false)
    }
}
