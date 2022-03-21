//
//  Hide Delegate.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/11.
//

import Foundation
/// 隐藏委托关系
/// 在服务类上建立客户所需所有函数以隐藏委托关系
fileprivate class beforeRefactor {
    class Person {
        private var _department: Department
        init(_ department: Department) {
            _department = department
        }
        
        public func getDepartment() -> Department{
            return _department
        }
        
        public func setDepartment(_ arg: Department) {
            _department = arg
        }
    }
    class Department {
        private var _manager: Person
        private var _chargeCode: String
        init(_ manager: Person,_ chargeCode: String) {
            _manager = manager
            _chargeCode = chargeCode
        }
        var manager: Person {
            get{ return _manager}
            set{ _manager = newValue }
        }
        var chargeCode: String {
            get{ return _chargeCode}
            set{ _chargeCode = newValue }
        }
    }
}

fileprivate class afterRefactor {
    class Person {
        private var _department: Department
        init(_ department: Department) {
            _department = department
        }
        
        public func getDepartment() -> Department{
            return _department
        }
        
        public func getManager() -> Person{ // 在这里的改动
            return _department.manager
        }
        
        public func setDepartment(_ arg: Department) {
            _department = arg
        }
    }
    class Department {
        private var _manager: Person
        private var _chargeCode: String
        init(_ manager: Person,_ chargeCode: String) {
            _manager = manager
            _chargeCode = chargeCode
        }
        var manager: Person {
            get{ return _manager}
            set{ _manager = newValue }
        }
        var chargeCode: String {
            get{ return _chargeCode}
            set{ _chargeCode = newValue }
        }
    }
}
