//
//  TestTypeDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2025/1/19.
//

import Foundation

class Subjects {
    var physics: String
    init(physics: String) {
        self.physics = physics
    }
}

class Chemistry: Subjects {
    var equations: String
    init(physics: String, equations: String) {
        self.equations = equations
        super.init(physics: physics)
    }
}

class Maths: Subjects {
    var formulae: String
    init(physics: String, formulae: String) {
        self.formulae = formulae
        super.init(physics: physics)
    }
}

class TestTypeChangeDemo {
    func testMain() {
        testIsType()
        testAsType()
        testAny()
        testAnyObject()
        testOC()
    }
    
    func testOC() {
        let ocDemo = TestTypeChangeOC();
        ocDemo.testMain();
    }
    
    func testIsType() {
        
        let sa = [
            Chemistry(physics: "固体物理", equations: "赫兹"),
            Maths(physics: "流体动力学", formulae: "千兆赫"),
            Chemistry(physics: "热物理学", equations: "分贝"),
            Maths(physics: "天体物理学", formulae: "兆赫"),
            Maths(physics: "微分方程", formulae: "余弦级数")]


        let samplechem = Chemistry(physics: "固体物理", equations: "赫兹")
        print("实例物理学是: \(samplechem.physics)")
        print("实例方程式: \(samplechem.equations)")


        let samplemaths = Maths(physics: "流体动力学", formulae: "千兆赫")
        print("实例物理学是: \(samplemaths.physics)")
        print("实例公式是: \(samplemaths.formulae)")

        var chemCount = 0
        var mathsCount = 0
        for item in sa {
            if (item is Maths) {
                mathsCount += 1
            } else if (item is Chemistry) {
                chemCount += 1
            }
        }
        
        print("化学科目包含 \(chemCount) 个主题，数学包含 \(mathsCount) 个主题")
    }
    
    func testAsType() {

        let sa = [
            Chemistry(physics: "固体物理", equations: "赫兹"),
            Maths(physics: "流体动力学", formulae: "千兆赫"),
            Chemistry(physics: "热物理学", equations: "分贝"),
            Maths(physics: "天体物理学", formulae: "兆赫"),
            Maths(physics: "微分方程", formulae: "余弦级数")]


        let samplechem = Chemistry(physics: "固体物理", equations: "赫兹")
        print("实例物理学是: \(samplechem.physics)")
        print("实例方程式: \(samplechem.equations)")


        let samplemaths = Maths(physics: "流体动力学", formulae: "千兆赫")
        print("实例物理学是: \(samplemaths.physics)")
        print("实例公式是: \(samplemaths.formulae)")


        for item in sa {
            if let show = item as?  Chemistry {
                print("化学主题是: '\(show.physics)', \(show.equations)")
            } else if let example = item as? Maths {
                print("数学主题是: '\(example.physics)',  \(example.formulae)")
            }
        }
    }
    
    func testAny() {
        var exampleany = [Any]()
        exampleany.append(12)
        exampleany.append(3.14)
        exampleany.append("Any 示例")
        exampleany.append(Chemistry(physics: "固体物理", equations: "兆赫"))
        for item2 in exampleany {
            switch item2 {
            case let someInt as Int:
                    print("整型值为 \(someInt)")
            case let someDouble as Double where someDouble > 0:
                print("Pi 值为 \(someDouble)")
            case let someString as String:
                print("\(someString)")
            case let phy as Chemistry:
                    print("主题 '\(phy.physics)', \(phy.equations)")
            default:
                    print("None")
            }
        }
    }
    
    func testAnyObject(){
        let saprint:[AnyObject] =  [
            Chemistry(physics: "固体物理", equations: "赫兹"),
            Maths(physics: "流体动力学", formulae: "千兆赫"),
            Chemistry(physics: "热物理学", equations: "分贝"),
            Maths(physics: "天体物理学", formulae: "兆赫"),
            Maths(physics: "微分方程", formulae: "余弦级数")]
        
        for item in saprint {
            if let show = item as? Chemistry {
                print("化学主题是: '\(show.physics)', \(show.equations)")
            } else if let example = item as? Maths {
                print("数学主题是: '\(example.physics)',  \(example.formulae)")
            }
        }
    }

    func testDynamic(){
        var aa:Any = 12;
        aa = 3.14;
        aa = "String";
        
        let bb = 1;
        switch(bb) {
        case 1:
            print("aaa")
            fallthrough
        case 2:
            print("22")
        default:
            print("dd")
        }
    }
}
