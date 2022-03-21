//
//  Extract Class.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/11.
//

import Foundation

/// 提取类
/// 建立一个新类,将相关的字段和函数从旧类搬移到新类
fileprivate class beforeRefactor {
    class Person {
        let _name: String
        var _officeNumber: String
        var _officeAreaCode: String
        
        init(_ name: String,_ officeNumber: String,_ officeAreaCode: String) {
            _name = name
            _officeNumber = officeNumber
            _officeAreaCode = officeAreaCode
        }
        
        func getName() -> String {
            return _name
        }
        
        func getTelephoneNumber() -> String {
            return "(" + _officeAreaCode + ")" + _officeNumber
        }
        
        func getOfficeAreaCode() -> String {
            return _officeAreaCode
        }
        
        func setOfficeAreaCode(_ arg: String) {
            _officeAreaCode = arg
        }
        
        func getOfficeNumber() -> String {
            return _officeNumber
        }
        
        func setOfficeNumber(_ arg: String) {
            _officeNumber = arg
        }
        

        
    }
}

fileprivate class afterRefactor {
    class Person {
        let _name: String
        let _telephoneNumber: TelephoneNumber

        init(_ name: String,_ telephoneNumber: TelephoneNumber ) {
            _name = name
            _telephoneNumber = telephoneNumber
        }
        
        func getName() -> String {
            return _name
        }
        
        func getOfficeTelephone() -> TelephoneNumber {
            return _telephoneNumber
        }
        
        func getTelephoneNumber() -> String {
            return "(" + _telephoneNumber.getOfficeAreaCode() + ")" + _telephoneNumber.getOfficeNumber()
        }
        
    }
    
    class TelephoneNumber {
        var _officeNumber: String
        var _officeAreaCode: String
        
        init(_ officeNumber: String,_ officeAreaCode: String) {
            _officeNumber = officeNumber
            _officeAreaCode = officeAreaCode
        }
        
        func getOfficeAreaCode() -> String {
            return _officeAreaCode
        }
        
        func setOfficeAreaCode(_ arg: String) {
            _officeAreaCode = arg
        }
        
        func getOfficeNumber() -> String {
            return _officeNumber
        }
        
        func setOfficeNumber(_ arg: String) {
            _officeNumber = arg
        }
        
    }
}

/// ** 存在问题新类的归属问题,能不能被访问,如果能被访问是公共的入口
/// 还是只能从上一级的类访问
