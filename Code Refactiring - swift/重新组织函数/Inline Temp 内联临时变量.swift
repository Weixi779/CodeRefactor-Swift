//
//  Inline Temp.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/5.
//

import Foundation
/// 内联临时变量
/// 将所有对该变量的引用动作,替换为对他赋值的那个表达式本身
fileprivate class beforeRefactor {
    func example() -> Bool {
        let basePrice = 123 * 3
        return basePrice > 1000
    }
}

fileprivate class afterRefactor {
    func example() -> Bool {
        return 123 * 3 > 1000
    }
}
