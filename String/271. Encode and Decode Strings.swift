//
//  271. Encode and Decode Strings.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2024/8/3.
//

import Foundation

class Codec {
    func encode(_ strs: [String]) -> String {
        var encodedStr = ""
        for str in strs {
            encodedStr += str
            encodedStr += "λ"
        }
        return encodedStr
    }
    
    func decode(_ s: String) -> [String] {
        var decoding: [String] = []
        var word = ""
        for char in s {
            if char == "λ" {
                decoding.append(word)
                word = ""
            } else {
                word += String(char)
            }
        }
        return decoding
    }
}
