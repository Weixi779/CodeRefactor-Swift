//
//  Introduce Explaining Variable.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/7.
//

import Foundation
/// 引入解释性变量
/// 将该复杂表达式的结果放进一个临时变量,以此变量名称来解释表达式用途
fileprivate class beforeRefactor {
    let _quantity = 3.0
    let _itemPrice: Double = 250
    func price() -> Double {
        return _quantity * _itemPrice - max(0, _quantity - 500) * _itemPrice * 0.05 + min(_quantity * _itemPrice * 0.1, 100)
    }
}

fileprivate class afterRefactor {
    let _quantity: Double = 3.0
    let _itemPrice: Double = 250
    func price() -> Double {
        // price is base price - quantity discount + shipping
        let basePrice = _quantity * _itemPrice
        let quantityDiscount = max(0, _quantity - 500) * _itemPrice * 0.05
        let shipping = min(_quantity * _itemPrice * 0.1, 100)
        return basePrice - quantityDiscount + shipping
        // return basePrice() - quantityDiscount() + shipping()
    }
    
    private func basePrice() -> Double {
        return _quantity * _itemPrice
    }
    
    private func quantityDiscount() -> Double {
        return max(0, _quantity - 500) * _itemPrice * 0.05
    }
    
    private func shipping() -> Double {
        min(_quantity * _itemPrice * 0.1, 100)
    }
}
// - 规矩是死的,但人是活的
// 他和 extract method 或多或少有一些相同或不同之处
// 个人感觉不是很长的时候可以使用 let 提取变量试试 特别是一两句话就可以说明白的时候
