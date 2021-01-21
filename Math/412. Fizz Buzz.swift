//
//  412. Fizz Buzz.swift
//  LeetCodeRepo
//
//  Created by ShaoJen Chen on 2021/1/20.
//
//
//Write a program that outputs the string representation of numbers from 1 to n.
//
//But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.
//
//Example:
//
//n = 15,
//
//Return:
//[
//    "1",
//    "2",
//    "Fizz",
//    "4",
//    "Buzz",
//    "Fizz",
//    "7",
//    "8",
//    "Fizz",
//    "Buzz",
//    "11",
//    "Fizz",
//    "13",
//    "14",
//    "FizzBuzz"
//]


import Foundation

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var result = [String]()
        for number in 1 ... n {
            if number % 3 == 0 && number % 5 == 0 {
                result.append("FizzBuzz")
            }
            else if number % 3 == 0 {
                result.append("Fizz")
            }
            else if number % 5 == 0 {
                result.append("Buzz")
            }
            else {
                result.append(String(number))
            }
        }
        return result
    }
}
