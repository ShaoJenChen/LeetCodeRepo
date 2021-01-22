//
//  204. Count Primes.swift
//  LeetCodeRepo
//
//  Created by 陳劭任 on 2021/1/21.
//

//Count the number of prime numbers less than a non-negative number, n.
//
//
//
//Example 1:
//
//Input: n = 10
//Output: 4
//Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
//Example 2:
//
//Input: n = 0
//Output: 0
//Example 3:
//
//Input: n = 1
//Output: 0
//
//
//Constraints:
//
//0 <= n <= 5 * 106

import Foundation

//Math
//2464 ms
class Solution {
    func countPrimes(_ n: Int) -> Int {
        
        func isPrime(_ n: Int) -> Bool {
            
            let sqrtNumber = Int(sqrt(Double(n)))
            
            if sqrtNumber >= 2 {
                for i in 2 ... sqrtNumber {
                    if n % i == 0 { return false }
                }
            }
            return true
        }
        
        if n == 0 || n == 1 { return 0 }
        var count = 0
        for i in 2 ..< n {
            if isPrime(i) {
                count += 1
            }
        }
        return count
    }
    
}

//HashTable
//84 ms
class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n < 2 {
            return 0
        }
        var isPrime = Array(repeating: true, count: n)
        var index = 2
        var count = 0
        while index < n {
            
            if isPrime[index] {
                count += 1
            }
            
            var j = index * index
            
            if j < n, isPrime[j] {
                while j < n {
                    isPrime[j] = false
                    j += index
                }
            }
            index += 1
        }
        return count
    }
}
