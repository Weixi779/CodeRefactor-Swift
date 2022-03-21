//
//  Replace Method with Method Object.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/7.
//

import Foundation
/// 以函数对象取代函数
/// 将函数放进一个对象中,可以将一个大型函数分解为多个小型函数
fileprivate class beforeRefactor {
    class Account {
        func gamma(_ inputVal: Int, _ quantity: Int, _ yearToDate: Int) -> Int {
            let importantValue1 = (inputVal * quantity)
            var importantValue2 = (inputVal * yearToDate) + 100
            if (yearToDate - importantValue1) > 100 {
                importantValue2 -= 20
            }
            let importantValue3 = importantValue2 * 7
            return importantValue3 - 2 * importantValue1
        }
    }
}

fileprivate class afterRefactor {
    class Account {
        func gamma(_ inputVal: Int, _ quantity: Int, _ yearToDate: Int) -> Int {
            return Gamma(inputVal, quantity, yearToDate).compute()
        }
    }
    
    class Gamma {
        private let _inputVal: Int
        private let _quantity: Int
        private let _yearToDate: Int
        private var _importantValue1: Int = 0
        private var _importantValue2: Int = 0
        private var _importantValue3: Int = 0
        
        init( _ inputValArg: Int, _ quantityArg: Int, _ yearToDate: Int) {
            _inputVal = inputValArg
            _quantity = quantityArg
            _yearToDate = yearToDate
        }
        
        func compute() -> Int {
            _importantValue1 = (_inputVal * _quantity)
            _importantValue2 = (_inputVal * _yearToDate) + 100
            importantThing()
            let _importantValue3 = _importantValue2 * 7
            return _importantValue3 - 2 * _importantValue1
        }
        
        func importantThing() {
            if (_yearToDate - _importantValue1) > 100 {
                _importantValue2 -= 20
            }
        }
    }
}
