//
//  TestSendableDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/2/9.
//

import Foundation

struct UserStruct:Sendable {
    let name: String
    let age: Int
}

final class UserClass:Sendable {
    let name:String
    let age:Int
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
}

//To declare conformance to Sendable without any compiler enforcement, write @unchecked Sendable.
final class UserManager: @unchecked Sendable {
    private let queue = DispatchQueue(label: "com.example.userManager")
    private var users:[UserStruct] = []
    
    func addUser(_ user: UserStruct) {
        queue.async {
            self.users.append(user)
        }
    }
}


actor BankAccountDemo {
    let accountNumber: Int
    var balance: Double
    var name: String
    var age: Int
    
    init(accountNumber: Int,balance: Double,name: String,age: Int) {
        self.accountNumber = accountNumber
        self.balance = balance
        self.name = name
        self.age = age
    }
      

    func user() -> UserStruct {
      return UserStruct.init(name: name, age: age)
    }
    
    func deposit(amount: Int) {
        
    }
}

extension BankAccountDemo {
    func addAge(amount: Int, completion:@Sendable (Int) -> Void) {
        age += amount
        completion(age)
        
    }
}

class AccountManager {
    
    let bankAccount = BankAccountDemo.init(accountNumber: 123456789, balance: 1_000,name:"",age:1)

  func depoist() async {
    // 下面的 bankAccount.accountNumber、bankAccount.deposit(amount: 1) 都属于cross-actor reference

    // 对 let accountNumber 可以像普通属性那样访问
    //
    print(bankAccount.accountNumber)

    // 而对于方法，无论是否是异步方法都需通过 await 调用
    //
    await bankAccount.deposit(amount: 1)
  }
}

extension AccountManager {
    func user() async -> UserStruct {
        return await bankAccount.user()
    }
}

extension AccountManager {
  func addAge() async {
    // Wraning: Non-sendable type '(Int) -> Void' passed in implicitly asynchronous call to actor-isolated instance method 'addAge(amount:completion:)' cannot cross actor boundary
    await bankAccount.addAge(amount: 1, completion: { age in
      print(age)
    })
  }
}


class TestSendableDemo {
    func testMain() {
        
    }
}
