//
//  2000. Reverse Prefix of Word.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/27.
//

import Foundation

class Solution {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        guard word.contains(ch) else { return word }
        let firstOccIndex = word.firstIndex(of: ch)!
        var prefixCount = firstOccIndex.encodedOffset
        var queue = [Character]()
        var word = word
        while prefixCount >= 0 {
            let firstCh = word.remove(at: word.startIndex)
            queue.append(firstCh)
            prefixCount -= 1
        }
        while queue.count > 0 {
            word.insert(queue.first!, at: word.startIndex)
            queue.remove(at: 0)
        }
        return word
    }
}


