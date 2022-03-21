//
//  1.1.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/3.
//

import Foundation


// 简单纯数据类
// 重构前
class Movie {
    static let childrens: Int = 2
    static let regulars: Int = 0
    static let new_release: Int = 1
    
    private let _title: String
    private var _price: Price
    
    init(title: String, price: Price) {
        _title = title
        _price = price
    }
    
    func getPriceCode() -> Int {
        return _price.getPriceCode()
    }
    
    func setPriceCode(_ arg: Int) {
        switch arg {
        case Movie.regulars: _price = RegularPrice()
        case Movie.new_release: _price = NewReleasePrice()
        case Movie.childrens: _price = ChildrensPrice()
        default: break
        }
    }
    
    func getTitle() -> String {
        return _title;
    }
    
    func getCharge(daysRented: Int) -> Double {
        return _price.getCharge(daysRented)
    }
    
    func getFrequentTenterPoints(daysRented: Int) -> Int {
        return _price.getFrequentTenterPoints(daysRented)
    }
}

// 表示某个顾客租了一部影片
class Rental {
    private var _movie: Movie
    private var _daysRented: Int
    
    init(moive: Movie, daysRented: Int) {
        _movie = moive
        _daysRented = daysRented
    }
    
    func getDaysRented() -> Int {
        return _daysRented
    }
    
    func getDaysRented() -> Double {
        return Double(_daysRented)
    }
    
    func getMoive() -> Movie {
        return _movie
    }
    
    func getFrequentTenterPoints() -> Int {
        return getMoive().getFrequentTenterPoints(daysRented: _daysRented)
    }
    
    func getCharge() -> Double {
        return getMoive().getCharge(daysRented: _daysRented)
    }
    
}

class Customer {
    private var _name: String
    private var _rentals = [Rental]()
    
    init(name: String) {
        _name = name
    }
    
    func addRental(arg: Rental) {
        _rentals.append(arg)
    }
    
    func getName() -> String {
        return _name
    }
    
    func statement() -> String {
        var totalAmount = 0
        var frequentRenterPoints = 0
        var result = "Rental Record for" + getName() + "\n"
        for _rental in _rentals {
            var thisAmount: Double = 0
            switch(_rental.getMoive().getPriceCode()) {
            case Movie.regulars:
                thisAmount += 2
                if (_rental.getDaysRented() > 2) {
                    thisAmount += (_rental.getDaysRented() - 2) * 1.5
                }
                
            case Movie.new_release:
                thisAmount += Double(_rental.getDaysRented() * 3)
                
            case Movie.childrens:
                thisAmount += 1.5
                if (_rental.getDaysRented() > 3) {
                    thisAmount += (_rental.getDaysRented() - 3) * 1.5
                }
            default: break
            }
            frequentRenterPoints += 1
            if (_rental.getMoive().getPriceCode() == Movie.new_release) && _rental.getDaysRented() > 1 {
                frequentRenterPoints += 1
            }
            result += "\t" + _rental.getMoive().getTitle() + "\t" + thisAmount.description + "\n"
            totalAmount += Int(thisAmount)
        }
        result += "Amount owed is " + totalAmount.description + "\n"
        result += "You earned " + frequentRenterPoints.description + " frequent renter points"
        return result
    }
    
    // 重构后

    
    func statementII() -> String {
        var result = "Rental Record for" + getName() + "\n"
        for _rental in _rentals {
            result += "\t" + _rental.getMoive().getTitle() + "\t" + _rental.getCharge().description + "\n"
        }
        result += "Amount owed is " + getTotalCharge().description + "\n"
        result += "You earned " + getTotalfrequentRenterPoints().description + " frequent renter points"
        return result
    }
    
    func getTotalCharge() -> Double {
        return _rentals.reduce(0, { $0 + $1.getCharge() })
    }
    
    func getTotalfrequentRenterPoints() -> Int {
        return _rentals.reduce(0, { $0 + $1.getFrequentTenterPoints() })
    }
}

protocol Price {
    func getPriceCode() -> Int
    func getCharge(_ daysRented: Int) -> Double
    func getFrequentTenterPoints(_ daysRented: Int) -> Int
}

class ChildrensPrice: Price {
    func getPriceCode() -> Int {
        return Movie.childrens
    }
    func getCharge(_ daysRented: Int) -> Double {
        var res: Double = 1.5
        if daysRented > 3 {
            res += Double(daysRented - 3) * 1.5
        }
        return res
    }
    func getFrequentTenterPoints(_ daysRented: Int) -> Int {
        return 1
    }
    
}

class NewReleasePrice: Price {
    func getPriceCode() -> Int {
        return Movie.new_release
    }
    
    func getCharge(_ daysRented: Int) -> Double {
        return Double(daysRented * 3)
    }
    func getFrequentTenterPoints(_ daysRented: Int) -> Int {
        return daysRented > 1 ? 2 : 1
    }
}

class RegularPrice: Price {
    func getPriceCode() -> Int {
        return Movie.regulars
    }
    
    func getCharge(_ daysRented: Int) -> Double {
        var res: Double = 2
        if daysRented > 2 {
            res += Double(daysRented - 2) * 1.5
        }
        return res
    }
    func getFrequentTenterPoints(_ daysRented: Int) -> Int {
        return 1
    }
}


/*
 手法总结:
 1. extract method
 2. move method
 3. replace conditional with polymorphism
 4. self encapsulate field
 5. replace type code with state/strategy
 */
