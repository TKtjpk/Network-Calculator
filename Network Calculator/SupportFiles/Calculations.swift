//
//  Calculations.swift
//  Network Calculator
//
//  Created by Tomasz Kubicki on 01/09/2023.
//

import Foundation

func paddind(number: Int) -> String {
    let string = String(number, radix: 2)
    var padded = string
    if number >= 0 && number < 256 {
        for _ in 0..<(8 - string.count) {
            padded = "0" + padded
        }
    }
    return padded
}

func maskCIDRNotation(subnet_mask: [Int]) -> Int {
    let sum = subnet_mask.reduce(0, {x, y in x + y})
    return sum
}

func ipCIDRNotation(ip_address: [Int]) -> String {
    var counter = 0
    var ipAddress = ""
    for i in ip_address {
        ipAddress.append(String(i))
        if counter < 3 {
            ipAddress.append(".")
        }
        counter += 1
    }
    
    return ipAddress
}
