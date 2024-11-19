//
//  ViewController.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2024/11/12.
//

import UIKit

class ViewController: UIViewController {
    
    var boolean_expression:Bool = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testIf();
        testFor()
    }
    
    func testIf() {
        boolean_expression = false;
        if boolean_expression {
            print("boolean_expression:%b",boolean_expression);
        } else {
            print("boolean_expression:\(boolean_expression)");
        }
    }
    
    func testFor(){
        testForIn();
        testForWhile();
        testForWhile();
    }
    
    func testForIn() {
        for index in 1...5 {
            print("\(index) 乘于 5 为：\(index * 5)")
        }
        
        var someInts:[Int] = [10, 20, 30]
        for index in 0..<someInts.count {
            print( "索引 [\(index)] 对应的值为 \(someInts[index])")
        }
    }
    
    func testForWhile() {
        var index = 10
        while index < 20
        {
           print( "index 的值为 \(index)")
           index = index + 1
        }
    }
    
    func testForWhile() -> Int {
        var index = 15

        repeat{
            print( "index 的值为 \(index)")
            index = index + 1
        }while index < 20
        
        return 0
    }


}

