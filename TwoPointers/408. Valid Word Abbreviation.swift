//
//  408. Valid Word Abbreviation.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/6/25.
//

import Foundation


class Solution {
    func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
        var i = 0
        var j = 0
        var mutatedWord = Array(word)
        var mutatedAbbr = Array(abbr)
        
        while i < mutatedWord.count && j < mutatedAbbr.count {
            if mutatedWord[i] == mutatedAbbr[j] {
                i += 1
                j += 1
            }
            else if mutatedAbbr[j].isNumber {
                var num = ""
                if mutatedAbbr[j] == "0" {
                    return false
                }
            
                while j < mutatedAbbr.count && mutatedAbbr[j].isNumber {
                    num += String(mutatedAbbr[j])
                    j += 1
                }
                
                i += Int(num)!
                
            }
            else {
                return false
            }

        }
        
        return i == mutatedWord.count && j == mutatedAbbr.count
    }
}
