//
//  605. Can Place Flowers.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/13.
//

import Foundation


class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        //1. zero > n
        //2. not adjacent - current plots zero and previous && next are also zero
        var n = n
        var flowerbed = flowerbed

        let zeroCount = flowerbed.filter({ $0 == 0 }).count
        if zeroCount < n { return false }

        for (index, isOccupy) in flowerbed.enumerated() {
            guard n > 0 else { break }
            //edgeCase
            if flowerbed.count >= 2 {
                if index == 0 && isOccupy == 0 && flowerbed[index + 1] == 0 {
                    n -= 1
                    flowerbed[index] = 1
                }
                else if index == flowerbed.count - 1 && isOccupy == 0 && flowerbed[index - 1] == 0 {
                    n -= 1
                    flowerbed[index] = 1
                }
            }
            //edgeCase
            if flowerbed.count == 1 {
                if isOccupy == 0 {
                    n -= 1
                    flowerbed[index] = 1
                }
            }

            guard index > 0 && index < flowerbed.count - 1 else { continue }

            if isOccupy == 0 && flowerbed[index - 1] == 0 && flowerbed[index + 1] == 0 {
                n -= 1
                flowerbed[index] = 1
            }
        
        }

        return n == 0
    }
}
