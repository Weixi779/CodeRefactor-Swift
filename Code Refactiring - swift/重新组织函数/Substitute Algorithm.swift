//
//  Substitute Algorithm.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/7.
//

import Foundation
/// 替换算法
/// 将函数本体替换为另一个算法
fileprivate class beforeRefactor {
    func foundPerson(_ people: [String]) -> String {
        for person in people {
            if person == "Don" {
                return "Don"
            }
            if person == "John" {
                return "John"
            }
            if person == "Kent" {
                return "Kent"
            }
        }
        return ""
    }
}

fileprivate class afterRefactor {
    func foundPerson(_ people: [String]) -> String {
        let candidates = ["Don", "John", "Kent"]
        for person in people {
            if candidates.contains(person) {
                return person
            }
        }
        return ""
    }
}
// 在代码块尽量小的时候,可以更清晰的修改算法
// 无论是性能还是 可读性
