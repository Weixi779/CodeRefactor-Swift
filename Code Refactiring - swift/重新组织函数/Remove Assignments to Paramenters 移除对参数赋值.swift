//
//  Remove Assignments to Paramenters.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/7.
//

import Foundation
/// 移除对参数赋值
/// 以一个临时变量取代该参数的位置
/// swift 本身相比其他语言就已经禁止了
fileprivate class beforeRefactor {
    func discount(_ inputVal: Int, _ quantity: Int, _ yearToDate: Int) -> Int {
        // if inputVal > 50 { inputVal -= 2}
        // if quantity > 100 { inputVal -= 1}
        // if yearToDate > 10000 { inputVal -= 4 }
        return inputVal
    }
}

fileprivate class afterRefactor {
    func discount(_ inputVal: Int, _ quantity: Int, _ yearToDate: Int) -> Int {
        var result = inputVal
         if inputVal > 50 { result -= 2}
         if quantity > 100 { result -= 1}
         if yearToDate > 10000 { result -= 4 }
        return result
    }
}
