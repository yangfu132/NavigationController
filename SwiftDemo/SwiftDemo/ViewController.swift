//
//  ViewController.swift
//  SwiftDemo
//
//  Created by FlutterRole on 2024/11/12.
//

import UIKit
import WebKit


class ViewController: UIViewController,WKNavigationDelegate, WKScriptMessageHandler {
    
    var webView:WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//#if 0
//        if let filePath = Bundle.main.path(forResource: "index", ofType: "html") {
//            let fileURL = URL(fileURLWithPath: filePath)
//            webView?.loadFileURL(fileURL, allowingReadAccessTo: fileURL)
//        }
//#else
        let myURL = URL(string: "http://127.0.0.1:5000")
        let myRequest = URLRequest(url: myURL!)
        webView?.load(myRequest)
        testMain()
//#endif
    }
    
    //MARK: - WebView
    
    override func loadView() {
        let contentController = WKUserContentController()
        contentController.add(self, name: "nativeCallback")
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        webView = WKWebView(frame: .zero, configuration: config)
        webView!.navigationDelegate = self
        view = webView!
        
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "nativeCallback" {
            if let msg = message.body as? String {
                showAlert(message: msg)
            }
        }
    }

    func showAlert(message: String) {
        let alertController = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("displayDate()") { (any, error) in
            if (error != nil) {
                print(error ?? "err")
            }
        }
    }
    
    // MARK: - test
    
    var boolean_expression:Bool = true;
    
    func testMain() {
        // Do any additional setup after loading the view.
//        testFor()
//        testString()
//        testArray()
//        testIf();
//        testDictionary();
        
        testBlok();
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
//        testMap()
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

