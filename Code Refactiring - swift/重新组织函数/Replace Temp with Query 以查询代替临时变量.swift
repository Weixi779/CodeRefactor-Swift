//
//  Replace Temp with Query.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/7.
//

import Foundation
/// 以查询代替临时变量
/// 将这个表达式提炼到一个独立函数中,将这个临时变量的所有引用点替换为对新函数的调用
fileprivate class beforeRefactor {
    let _quantity: Int = 3
    let _itemPrice: Double = 250
    func getPrice() -> Double {
        let basePrice = Double(_quantity) * _itemPrice
        let discountFactor: Double
        if (basePrice > 1000) {
            discountFactor = 0.95
        } else {
            discountFactor = 0.98
        }
        return basePrice * discountFactor
    }
    
}

fileprivate class afterRefactor {
    let _quantity: Int = 3
    let _itemPrice: Double = 250
    func getPrice() -> Double {
        return basePrice() * discountFactor()
    }
    
    private func basePrice() -> Double {
        return Double(_quantity) * _itemPrice
    }
    
    private func discountFactor() -> Double {
        if (basePrice() > 1000) {
            return 0.95
        } else {
            return 0.98
        }
    }
}

// 找到只被赋值一次的临时变量
// 将变量声明为final(let)
// 编译
// 准备提取
