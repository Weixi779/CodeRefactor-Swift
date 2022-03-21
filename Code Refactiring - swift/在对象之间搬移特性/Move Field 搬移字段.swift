//
//  Move Field.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/10.
//

import Foundation
/// 搬移字段
/// 在目标类新建一个字段,修改源字段的所有用户,令他们改用新字段
fileprivate class beforeRefactor {
    class Account {
        private let _type: AccountType
        private var _interestRate: Double
        
        init (type: AccountType, interestRate: Double) {
            _type = type
            _interestRate = interestRate
        }

        
        func interestForAmount_days(_ amount: Double, _ days: Int) -> Double {
            return _interestRate * amount * Double(days) / 365
        }
    }
    
    class AccountType {
        let _type: Int = 1
    }
}

fileprivate class afterRefactor {
    class Account {
        private let _type: AccountType
        
        init (type: AccountType) {
            _type = type
        }

        func interestForAmount_days(_ amount: Double, _ days: Int) -> Double {
            return _type.interestRate * amount * Double(days) / 365
        }
    }
    
    class AccountType {
        private var _interestRate: Double
        
        init(_ interestRate: Double) { _interestRate = interestRate }
        
        var interestRate: Double {
            get { return _interestRate}
            set { _interestRate = newValue}
        }

    }
}

// ** 如果_interestRate字段已经使用多次了那么可以先Self Encapsulate Field
// 先在自己作用域封装函数, 重构就是一步一步来
