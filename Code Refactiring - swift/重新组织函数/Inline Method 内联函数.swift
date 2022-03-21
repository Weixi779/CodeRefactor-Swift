//
//  Inline Method.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/5.
//

import Foundation
/// 内联函数
/// 在函数调用点插入函数本体,然后移除该函数
fileprivate class beforeRefactor {
    let _numberOfLateDeliveries = 4 // (测试用)
    func getRating() -> Int {
        return moreThanFiveLateDeliveries() ? 2 : 1
    }
    
    func moreThanFiveLateDeliveries() -> Bool {
        return _numberOfLateDeliveries > 5
    }
}

fileprivate class afterRefactor {
    let _numberOfLateDeliveries = 4 // (测试用)

    func getRating() -> Int {
        return (_numberOfLateDeliveries > 5) ? 2 : 1
    }
}
