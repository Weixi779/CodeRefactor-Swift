//
//  Move Method.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/8.
//

import Foundation
/// - 搬移函数
/// 在该函数最常应用的类中建立一个有着类似行为的新函数,将旧函数变成委托或者完全移除
fileprivate class beforeRefactor {
    class Account {
        private let _type: AccountType
        private let _daysOverdrawn: Double
        
        init (type: AccountType, dayOverDrawn: Double) {
            _type = type
            _daysOverdrawn = dayOverDrawn
        }

        func overdraftCharge() -> Double {
            if _type._type == 0 {
                if _daysOverdrawn > 7 {
                    var result = 10.0
                    result += Double(_daysOverdrawn - 7) * 0.85
                    return result
                }
            }
            return _daysOverdrawn * 1.75
        }
        
        func bankCharge() -> Double {
            var result = 4.5
            if _daysOverdrawn > 0 {
                result += overdraftCharge()
            }
            return result
        }
    }
    class AccountType {
        let _type: Int = 1
    }
}

fileprivate class afterRefactor {
    class Account {
        init (type: AccountType, dayOverDrawn: Double) {
            _type = type
            _daysOverdrawn = dayOverDrawn
        }
        private let _type: AccountType
        private let _daysOverdrawn: Double
        func overdraftCharge() -> Double {
            return _type.overdraftCharge(_daysOverdrawn)
        }
        
        func bankCharge() -> Double {
            var result = 4.5
            if _daysOverdrawn > 0 {
                result += _type.overdraftCharge(_daysOverdrawn)
            }
            return result
        }
    }
    class AccountType {
        let _type: Int = 1
        
        func overdraftCharge(_ daysOverdrawn: Double) -> Double {
            if _type == 0 {
                var result = 10.0
                if daysOverdrawn > 7 {
                    result += (daysOverdrawn - 7) * 0.85
                    return result
                }
            }
            return daysOverdrawn * 1.75
        }
    }
}
