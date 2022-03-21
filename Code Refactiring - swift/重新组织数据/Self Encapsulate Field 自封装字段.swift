//
//  Self Encapsulate Field 自封装字段.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/16.
//

import Foundation
/// - 自封装字段
/// 为这个字段建立取值/设值函数,并且只以这些函数来访问字段
fileprivate class beforeRefactor {
    class IntRange {
        private var _low, _high: Int
        init(_ low: Int, _ high: Int) {
            self._low = low
            self._high = high
        }
        func includes(_ arg: Int) -> Bool {
            return arg >= _low && arg <= _high;
        }
    }
}

fileprivate class afterRefactor {
    class IntRange {
        private var _low, _high: Int
        var low: Int {
            get { return _low }
            set { _low = newValue}
        }
        var high: Int {
            get { return _high }
            set { _high = newValue}
        }
        init(_ low: Int, _ high: Int) {
            self._low = low
            self._high = high
        }
        func includes(_ arg: Int) -> Bool {
            return arg >= low && arg <= high;
        }
        
        func grow(_ factor: Int) {
            low *= factor
        }
    }
    
    class CappedRange: IntRange {
        private let _cap: Int
        init(_ low: Int, _ high: Int, _ cap: Int) {
            self._cap = cap
            super.init(low, high)
        }
        func getHigh() -> Int {
            return min(super.high, _cap)
        }
    }
}
