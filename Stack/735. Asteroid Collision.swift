//
//  735. Asteroid Collision.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/3.
//

import Foundation

class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack = [Int]()
        for aste in asteroids {
            var isCurrentAstExplode = false
            if aste > 0 {
                stack.append(aste)
            }
            else {
                while let lastAste = stack.last, lastAste > 0 {
                    if -aste > lastAste {
                        stack.removeLast()
                    }
                    else if -aste == lastAste {
                        isCurrentAstExplode = true
                        stack.removeLast()
                        break
                    }
                    else {
                        isCurrentAstExplode = true
                        break
                    }
                }
                guard !isCurrentAstExplode else { continue }
                if stack.isEmpty || stack.last! < 0 {
                    stack.append(aste)
                }
            }
        }
        return stack
    }
}
