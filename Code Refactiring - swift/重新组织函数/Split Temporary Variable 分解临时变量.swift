//
//  Split Temporary Variable.swift
//  Code Refactiring - swift
//
//  Created by yunzhanghu1186 on 2022/3/7.
//

import Foundation


/// 分解临时变量
/// 针对每次赋值,创造一个独立、对应的临时变量
/// (如果之后的赋值语句是类似 i += xx 什么就不要分解他)

fileprivate class beforeRefactor {
    let _primaryForce = 20.0
    let _secondForce = 20.0
    let _mass = 10.0
    let _delay = 5
    func getDistanceTravelled(_ time: Int) -> Double {
        var result: Double
        var acc: Double = _primaryForce / _mass // acc第一次
        let primaryTime = Double(min(time, _delay))
        result = 0.5 * acc * primaryTime * primaryTime
        let secondaryTime = Double(time - _delay)
        if (secondaryTime > 0) {
            let primaryVel = Int(acc) * _delay
            acc = (_primaryForce + _secondForce) / _mass // acc 被使用了两次
            result += Double(primaryVel) * secondaryTime + 0.5 * acc * secondaryTime * secondaryTime
        }
        return result
    }
}

fileprivate class afterRefactor {
    let _primaryForce = 20.0
    let _secondForce = 20.0
    let _mass = 10.0
    let _delay = 5.0
    func getDistanceTravelled(_ time: Double) -> Double {
        return primaryResult(time) + secondResult(time)
    }
    
    private func getAcc(_ force: Double) -> Double {
        return force / _mass
    }

    private func getWork(_ acc: Double, _ time: Double) -> Double { // 1/2 a t2
        return 0.5 * acc * time * time
    }
    
    private func primaryResult(_ time:Double) -> Double {
        let time = min(time, _delay)
        return getWork( getAcc(_primaryForce) , time)
    }
    
    private func secondResult(_ time:Double) -> Double {
        let time = time - _delay
        if (time > 0) {
            let primaryVel = getAcc(_primaryForce) * _delay
            let secondAcc = getAcc(_primaryForce + _secondForce)
            return Double(primaryVel) * time + getWork(secondAcc, time)
        }
        return 0
    }
}
