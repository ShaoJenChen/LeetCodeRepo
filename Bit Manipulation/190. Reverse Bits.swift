//
//  190. Reverse Bits.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2020/6/23.
//

import Foundation

/**
 Reverse bits of a given 32 bits unsigned integer.
 */
/**
 Example 1:
 Input: 00000010100101000001111010011100
 Output: 00111001011110000010100101000000
 Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer 43261596, so return 964176192 which its binary representation is 00111001011110000010100101000000.
 
 Example 2:
 Input: 11111111111111111111111111111101
 Output: 10111111111111111111111111111111
 Explanation: The input binary string 11111111111111111111111111111101 represents the unsigned integer 4294967293, so return 3221225471 which its binary representation is 10111111111111111111111111111111.
 */
/**
 Note:
 
 Note that in some languages such as Java, there is no unsigned integer type. In this case, both input and output will be given as signed integer type and should not affect your implementation, as the internal binary representation of the integer is the same whether it is signed or unsigned.
 
 In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 2 above the input represents the signed integer -3 and the output represents the signed integer -1073741825.
 
 Follow up:
 If this function is called many times, how would you optimize it?
 */

class Solution {
    func reverseBits(_ n: Int) -> Int {
        var numberArray = [Int]()
        var number = n
        while number > 0 {
            if number == 1 {
                numberArray.append(1)
                break
            }
            numberArray.append(number % 2)
            number = number / 2
        }
        while numberArray.count < 32 {
            numberArray.append(0)
        }
        var result = 0
        
//        for (index, element) in numberArray.enumerated() {
//            if element == 0 { continue }
//            let powNumber = pow(Double(2), Double(numberArray.count - index - 1))
//            result += Int(powNumber)
//        }
        
        for i in 0 ..< numberArray.count {
            result |= numberArray[i] << (numberArray.count - i - 1)
        }
        
        return result
    }
    
    func reverseBits(_ n: Int) -> Int {
            
            var reversedArr = [Int]()
            var number = n
            
            var index = 31
            while index >= 0 {
                reversedArr.append(number % 2)
                index -= 1
                number /= 2
            }

            var result = 0
            
            for (index, digital) in reversedArr.enumerated() {
                result |= digital << (reversedArr.count - 1 - index)
            }

            return result
    }
}
