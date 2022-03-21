//
//  Extract Method.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/4.
//

import Foundation
/// 提炼函数
/// 将这段代码放进一个独立函数中,并将函数名称解释该函数的用途

fileprivate class beforeRefactor {
    func printOwing(_ amount: Double) {
        let testing = [Int]()
        var outstanding = amount * 1.2
        
        // print banner
        print("**************************")
        print("***** Customer Owes ******")
        print("**************************")
        
        outstanding += Double(testing.reduce(0, { $0 + $1 }))
        
        // print details
        print("Name:" + "ssw")
        print("amount" + "\(outstanding)")
    }
}


fileprivate class afterRefactor {
    func printOwing(_ previousAmount: Double) {
        printBanner()
        let oustanding = getOutstanding(previousAmount * 1.2)
        printDetails(oustanding)
    }
    
    func printBanner() {
        print("**************************")
        print("***** Customer Owes ******")
        print("**************************")
    }
    
    func printDetails(_ amount: Double) {
        print("Name:" + "ssw")
        print("amount" + "\(amount)")
    }
    
    func getOutstanding(_ initialValue: Double) -> Double {
        let testing = [Int]()
        var result = initialValue
        result += Double(testing.reduce(0, { $0 + $1 }))
        return result
    }
}

