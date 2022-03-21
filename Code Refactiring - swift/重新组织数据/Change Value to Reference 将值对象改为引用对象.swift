//
//  Change Value to Reference 将值对象改为引用对象.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/17.
//

import Foundation
/// 将值对象改为引用对象
/// 将这个值对象变成引用对象
fileprivate class beforeRefactor {
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

fileprivate class afterRefactor {
    class Customer {
        
        private static var _instances = [String: Customer]()
        
        final let _name: String
        var name: String { return _name }
        
        private init(_ name: String) {
            _name = name
        }
        
        static func loadCustomers() {
            Customer("Lemon Car Hire").store()
            Customer("Associated Coffee Machines").store()
            Customer("Bilston Gasworks").store()
        }
        
        public static func getCustomer(_ name: String) -> Customer {
            return afterRefactor.Customer._instances[name] ?? Customer("nil")
        }
        public func store() {
            afterRefactor.Customer._instances[self._name] = self
        }
    }
    class Order {
        private var _customer: Customer
        var customer: String {
            get { return _customer._name }
            set { _customer = Customer.getCustomer(newValue) }
        }
        init(_ customer: String) {
            _customer = Customer.getCustomer(customer)
        }
        private func numberOfOrdersFor(_ orders: [Order], _ customer: String) -> String {
            return orders.reduce(0, { $0 + ($1.customer == customer ? 1 : 0) }).description
        }
    }
}
