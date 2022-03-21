//
//  Replace Date Value With Object 以对象取代数值.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/16.
//

import Foundation
/// 以对象取代数值
/// 将数据项变为对象
fileprivate class beforeRefactor {
    class Order {
        private var _customer: String
        var customer: String {
            get { return _customer }
            set { _customer = newValue }
        }
        init(_ customer: String) {
            _customer = customer
        }
        private func numberOfOrdersFor(_ orders: [Order], _ customer: String) -> String {
            return orders.reduce(0, { $0 + ($1.customer == customer ? 1 : 0) }).description
        }
    }
}

fileprivate class afterRefactor {
    class Customer {
        final let _name: String
        var name: String {return _name}
        init(_ name: String) {
            _name = name
        }
    }
    class Order {
        private var _customer: Customer
        var customer: String {
            get { return _customer._name }
            set { _customer = Customer(newValue) }
        }
        init(_ customer: String) {
            _customer = Customer(customer)
        }
        private func numberOfOrdersFor(_ orders: [Order], _ customer: String) -> String {
            return orders.reduce(0, { $0 + ($1.customer == customer ? 1 : 0) }).description
        }
    }
}
