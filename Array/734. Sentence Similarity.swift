//
//  734. Sentence Similarity.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/7/22.
//

import Foundation

class Solution {
    func areSentencesSimilar(_ sentence1: [String], _ sentence2: [String], _ similarPairs: [[String]]) -> Bool {
        //1. s1 length == s2 length
        //2. s1[i] s2[i] contains in similarPairs[i]
        //3. s1[i] == s2[i]

        guard sentence1.count == sentence2.count else { return false }

        var isSimilar = Array(repeating: false, count: sentence1.count)
        
        for i in 0 ..< sentence1.count {
            if sentence1[i] == sentence2[i] { isSimilar[i] = true }

            let allSimilarPairs = similarPairs.filter({ $0.contains(sentence1[i]) })
            
            guard allSimilarPairs.filter({ $0.contains(sentence2[i])}).count >= 1 else { continue }

            isSimilar[i] = true

        }
        return !isSimilar.contains(false)
    }
}
