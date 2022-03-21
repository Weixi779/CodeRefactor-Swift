//
//  Intriduce Local Extension.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/16.
//

import Foundation
/// 引入本地扩展
/// 建立一个新类,使它包括这些额外函数.让这个拓展品成为原类的子类或者包装类
fileprivate class beforeRefactor {
    class Date {
        var year, month, day: Int
        init(_ year: Int, _ month: Int, _ day: Int) {
            self.year = year
            self.month = month
            self.day = day
            print("\(year)-\(month)-\(day)")
        }
        func nextDay(_ arg: Date) -> Date {
            return Date(year,month,day+1)
        }
    }
}

fileprivate class afterRefactor {
    class Date {
        var year, month, day: Int
        init(_ year: Int, _ month: Int, _ day: Int) {
            self.year = year
            self.month = month
            self.day = day
            print("\(year)-\(month)-\(day)")
        }
    }
    class MfDateSub: Date {
        init(_ arg: Date) {
            super.init(arg.year, arg.month, arg.day)
        }
        func nextDay() -> Date {
            return Date(year,month,day+1)
        }
    }
}
