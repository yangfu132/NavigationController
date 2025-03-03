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
//        testFor()
//        testString()
//        testArray()
//        testIf();
//        testDictionary();
        
        //testBlok();
//        testEnum();
        //testClass();
//        testProperty();
//        testConstruct();
//        testDeInit();
//        testOption();
//        testTypeChange()
//        testClassStruct()
//        testOC()
//        testExtensionDemo()
//        testMianShi()
//        testProtocol()

//        testRuntime()
        testMap()
        
    }
    
    func testMap() {
        let demo = TestMapDemo()
        demo.testMain()
    }
    
    func testRuntime() {
        let demo = SDRuntimeDemo()
        demo.testMain()
    }
    
    func testProtocol() {
        let demo = TestProtocolDemo()
        demo.testMain()
    }
    
    func testMianShi() {
        let demo = MSMainDemo()
        demo.testMain()
    }
    
    func testButton() {
        
    }
    
    func testExtensionDemo() {
        let demo = TestExtensionDemo()
        demo.testMain()
    }
    
    func testOC() {
        let demo = TestOCMain()
        demo.test()
    }
    
    func testTestTaskGroupDemo() {
        let demo = TestTaskGroupDemo()
        demo.testMain()
    }
    
    func testClassStruct() {
        let demo = MSClassStructDemo();
        demo.testMain()
    }
    
    func testTypeChange() {
        let swiftDemo = TestTypeChangeDemo()
        swiftDemo.testMain()
    }
    
    func testOption() {
        let swiftDemo = TestOptionDemo()
        swiftDemo.testMain()
    }
    
    func testDeInit() {
        let demo = TestDeInitDemo();
        demo.testMain()
        
        let ocdemo = TestDeinitOC();
        ocdemo.testMain();
    }
    
    func testConstruct () {
        let demo = TestConstructDemo();
        demo.testMain();
    }
    
    func testProperty () {
        let swiftDemo = TestPropertyDemo()
        swiftDemo.testMain()
        
        let ocDemo = TestPropertyOC()
        ocDemo.testMain()
    }
    
    func testClass() {
        let classDemo = TestClassDemo()
        classDemo.testClass()
        
        
    }
    
    func testTuple(){
        let demoSwift = TestTupleDemo()
        demoSwift.testTuple()
    }
    
    func testEnum() {
        let enumSwift = TestEnumClass()
        enumSwift.testEnum()
        
        let enumOC = TestEnumOCClass()
        enumOC.testEnum()
    }
    
    func testArray() {
        let tsArrayObj:TestArrayClass = TestArrayClass()
        tsArrayObj.testArray()
    }
    
    func testString() {
        let tsStringObj:TestStringClass = TestStringClass();
        tsStringObj.testString()
    }
    
    func testFor(){
        let forDemo:TestForClass = TestForClass();
        forDemo.testFor()
    }

    func testBlok() {
        let blockDemo = TestBlockClass()
        blockDemo.testBlock()
        
        let demo = TestBlockOCClass()
        demo.testBlock()
    }
    
    func testDictionary() {
        let demo = TestDictionaryClass()
        demo.testDictionary()
    }
    
    func testIf() {
        boolean_expression = false;
        if boolean_expression {
            print("boolean_expression:%b",boolean_expression);
        } else {
            print("boolean_expression:\(boolean_expression)");
        }
    }
    
}

