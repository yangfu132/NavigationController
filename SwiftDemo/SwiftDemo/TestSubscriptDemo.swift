//
//  TestSubscriptDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/1/13.
//

import Foundation

struct subexample {
    let decrementer:Int
    subscript(index:Int) -> Int {
        return decrementer/index
    }
}

class DaysOfWeek {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday",
                        "Thursday", "Friday", "saturday"]
    subscript(index:Int) -> String {
        get {
            return days[index];
        }
        set (newValue) {
            self.days[index] = newValue
        }
    }
}


class TestSubscriptDemo {
    func testMain() {
        
    }
    
    func testStructSubscription() {
        let division = subexample(decrementer: 100);
        print("100 除以 9 等于 \(division[9])")
        print("100 除以 2 等于 \(division[2])")
        print("100 除以 3 等于 \(division[3])")
        print("100 除以 5 等于 \(division[5])")
        print("100 除以 7 等于 \(division[7])")
    }
    
    func testClassSubscription() {
        var p = DaysOfWeek()
        print(p[0])
        print(p[1])
        print(p[2])
        print(p[3])
    }
    
    
}
