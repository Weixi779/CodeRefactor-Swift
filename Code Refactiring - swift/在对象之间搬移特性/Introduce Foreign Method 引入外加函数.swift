//
//  Introduce Foreign Method.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/16.
//

import Foundation
/// 引入外加函数
/// 在客户类中建立一个函数,并以第一参数形式传入一个服务类实例
fileprivate class Date {
    let year, month, day: Int
    init(_ year: Int, _ month: Int, _ day: Int) {
        self.year = year
        self.month = month
        self.day = day
        print("\(year)-\(month)-\(day)")
    }
}
fileprivate class beforeRefactor {
    let newStart: Date = Date(2022, 3, 16+1)
}

fileprivate class afterRefactor {
    let newStart = nextDay( Date(2022, 3, 16) )
    private static func nextDay(_ arg: Date) -> Date {
        return Date(arg.year, arg.month, arg.day + 1)
    }
}
