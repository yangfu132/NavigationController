//
//  TestActorDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/8.
//

import Foundation


actor ChickenFeeder {
    let food = "worms"
    var numberOfEatingChickens: Int = 0
    
    func chickenStartsEating() {
        numberOfEatingChickens += 1
    }
    
    func chickenStopsEating() {
        numberOfEatingChickens -= 1
    }
}

extension ChickenFeeder {
    func notifyObservers() {
        NotificationCenter.default.post(name: NSNotification.Name("chicken.started.eating"), object: numberOfEatingChickens)
    }
}

actor BankAccount {
    private var balance: Double = 0.0
    private var age:Int = 1
    func deposit(amount: Double) {
        balance += amount
    }

    func withdraw(amount: Double) -> Double {
        if balance >= amount {
            balance -= amount
            return amount
        } else {
            return 0.0
        }
    }

    func getBalance() -> Double {
        return balance
    }
}

class TestActorDemo {
    
    
    func testMain() {
        
    }
    
    func testActor() async {
        let feeder = ChickenFeeder();
        await feeder.chickenStartsEating();
        print(await feeder.numberOfEatingChickens)
        print(feeder.food);
    }
    
    func testBankAccount (){
        let bank = BankAccount()
        Task {
            await bank.getBalance()
        }
        
    }
    
    
}
