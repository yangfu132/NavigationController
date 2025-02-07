//
//  TestTupleDemo.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2024/12/3.
//

import Foundation

class TestTupleDemo {
    func testTuple() {
        testCreate()
        testTypeAlias()
        testArgs()
        testReturn()
        testEqual()
        
    }
    
    func testCreate() {
        var aTuple = (10,"Xishi")
        aTuple = (10, name:"Xishi") // 后期添加名称，可行但无效
        print(aTuple)
        print(aTuple.0)
        print(aTuple.1)
        
        let (x,y) = aTuple
        print("(\(x),\(y)")

        
        var bTuple = (index:20,name:"Xishi")
        print(bTuple)
        print(bTuple.index)
        print(bTuple.name)
        print(bTuple.1)
        
        let (m,n):(Int,Int) = (1,2)
        let (a,b):(Int,String) = aTuple
        let (c,_) = aTuple
        print("a=\(a),b=\(b),c=\(c),m=\(m),n=\(n)")
        
    }
    
    func testTypeAlias() {
        typealias PersonTuple = (age: Int, name: String)

        let tuple: PersonTuple = (10, "season")
        print(tuple.age)
        print(tuple.name)
    }
    
    func testArgs(){
        func foo(_ args:(Int,Int,String))-> Int {
            print(args.0)
            return args.0
        }
        
        let arguments = (4,3,"hello")
        foo(arguments)
    }
    
    func testReturn(){
        func abc()->(Int,Int,String) {
            return (3,5,"Xishi")
        }
        
        let(a,b,c) = abc()
    }
    
    func testEqual() {
        let p0 = (1,2,3)
        let p1 = (1,2,3)
        print(p0 == p1)//true
        
        let p2 = (1,[2],3)
        let p3 = (1,[2],3)
        print(p2 == p3)//true
    }
}
