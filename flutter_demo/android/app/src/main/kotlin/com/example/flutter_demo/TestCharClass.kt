package com.example.flutter_demo

class TestCharClass {
    fun testChar() {
        testCharCreate()
        testCharEmpty()
        testCharFind()
        testCharAppend()
    }

    private  fun testCharCreate(){
        var varChar:Char = 'A'
        val valChar:Char = 'B'
        println("varChar is $varChar");
        println("valChar is $valChar");
    }

    private fun testCharEmpty(){
        var varChar:Char = ' '
        val valChar:Char = ' '
        println("varChar is $varChar");
        println("valChar is $valChar");
    }

    private fun testCharFind(){
        for (cc in "TestCharFind") {
            println("cc is $cc")
        }
    }

    private fun testCharAppend() {
        var varString:String = "A"
        val valChar:Char = 'B'
        varString = varString + valChar
        println("varString is $varString")
    }
}