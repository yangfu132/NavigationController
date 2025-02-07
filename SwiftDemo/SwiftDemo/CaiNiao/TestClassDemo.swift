//
//  TestClassDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2024/12/24.
//

import Foundation

class TestClassDemo {
    func testClass () {
        testEqual()
    }
    
    class SampleClass:Equatable {
        let myProperty: String
        init(s:String) {
            myProperty = s
        }
        
        static func == (lhs:SampleClass, rhs:SampleClass )->Bool {
            return lhs.myProperty == rhs.myProperty
        }
    }

    func testEqual() {
        let spClass1 = SampleClass(s: "Hello")
        let spClass2 = SampleClass(s: "Hello")
        if (spClass1 == spClass2) {
            print("相等\(spClass1.myProperty)")
        }
        
        if spClass1 === spClass2 {
            print("引用相同的类实例 \(spClass1)")
        }
        
        if spClass1 !== spClass2 {
            print("引用不相同的类实例 \(spClass2)")
        }
    }
    
    func testRuntimeType() {
        let spClass1 = SampleClass(s: "Hello")
        print("runtimeType:\(type(of: spClass1))");
    }
}

class TestDemo {
    struct Town {
        let region: String
        var population: Int
        var numberOfStoplights: Int

        init(region: String, population: Int, stoplights: Int) {
            self.region = region
            self.population = population
            numberOfStoplights = stoplights
        }
        
        // 初始化函数代理(它自己做不了, 但是通过别人来完成初始化)
        init(population: Int, stoplights: Int) {
            self.init(region: "N/A", population: population, stoplights: stoplights)
        }
        
        func printTownDescription() {
            print("Population: \(population); number of stoplights: \(numberOfStoplights); region: \(region)")
        }
        
        func changePopulation(_ population:Int) {
            
        }
    }
    
    class Monster  {
        var town: Town?
        var name: String // 如果不设置初始值, 就得指定变量的类型
        required init(town: Town?, monsterName: String) {
            self.town = town
                 name = monsterName
        }
        
        func terrorizeTown() {
            town?.changePopulation(-10) // 僵尸一出来就吃掉 10 个人, town 属性继承自父类 Monster
        }
    }
    
    class Zombie: Monster {
        var walksWithLimp = true
        private(set) var isFallingApart: Bool
        required init(town: Town?, monsterName: String) {
            self.isFallingApart = false
            super.init(town: town, monsterName: monsterName)
        }
        
        init(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
            walksWithLimp = limp
            isFallingApart = fallingApart
            super.init(town: town, monsterName: monsterName)
        }
        
        convenience init(limp: Bool, fallingApart: Bool) {
            self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
            if walksWithLimp {
                print("This zombie has a bad knee.")
            }
        }
        
        deinit {
            print("Zombie named \(name) is no longer with us.")
        }

        // final 用来防止子类重写父类的方法, 僵尸的行为都是一致的。子类不能改写
        final  override func terrorizeTown() {
              town?.changePopulation(-10) // 僵尸一出来就吃掉 10 个人, town 属性继承自父类 Monster
              super.terrorizeTown() // super 关键字专门用于继承, 所以枚举和结构体中没有。
          }
          func changeName(name: String, walksWithLimp: Bool) {
              self.name = name
              self.walksWithLimp = walksWithLimp
          }
    }
//    var myTown = Town(region: "West", population: 10000, stoplights: 6)
//    let fredTheZombie = Zombie(town: myTown, monsterName: "Fred")
    
}


