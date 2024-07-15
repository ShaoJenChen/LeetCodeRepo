//
//  841. Keys and Rooms.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/15.
//

import Foundation


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
