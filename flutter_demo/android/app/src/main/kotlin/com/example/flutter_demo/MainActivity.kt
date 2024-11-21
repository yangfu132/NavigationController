package com.example.flutter_demo

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        testIfElse();
        testIfIn();
        testIfWhen("3");
        testFor();
        testChar();
        testArray();
    }

    private fun testArray(){
        val demo = TestArrayClass()
        demo.testArray()
    }

    private fun testChar() {
        val testDemo = TestCharClass()
        testDemo.testChar()
    }

    private fun testIfElse() {
        var x = 0
        if( x>0 ){
            println("x 大于 0")
        }else if(x==0){
            println("x 等于 0")
        }else{
            println("x 小于 0")
        }

        var a = 1
        var b = 2
        val c = if (a>=b) a else b
        println("c 的值为 $c")
    }

    private fun testIfIn() {
        val x = 5;
        val y = 9;
        if (x in 1..8) {
            println("x is in scope");
        }
    }

    private fun testIfWhen (x:Any){
        when (x) {
            1 -> println("x == 1")
            2 -> println("x == 2")
            3,4->println("x==3 ,or x == 4")
            in 5..6->println("x is in the range")
            is String -> println("x is string $x");
            else -> {
                println("x not 1, x not 2");
            }
        }
    }
    private fun testFor() {
        testForIn();
        testForWhile();
        testForLabel();
    }
    private fun testForIn(){
        val items = listOf("apple","banana","kiwi");
        for (item in items) {
            println(item);
        }

        for (index in items.indices) {
            println("item at $index is ${items[index]}");
        }

        for ((index,value) in items.withIndex()) {
            println("the element at $index is $value")
        }
    }

    private fun testForWhile() : Int{
        var x = 5
        while(x > 0) {
            println( x--)
        }
        println("----do...while 使用-----")
        var y = 5
        do {
            println(y--)
        } while(y>0)

        return 0
    }

    private fun testForLabel():Int {
        loop@ for(i in 1..10) {
            println("i == $i");
            for (j in 1..10) {
                println("j == $j");
                if (i == 5 && j == 5) {
                    break@loop
                }
            }
        }
        val items = listOf(1,2,3);
        items.forEach lit@ {
            if (it == 2) return@lit
            println("lit it:$it")
        }

        items.forEach {
            if (it == 2) return@forEach
            println("forEach it:$it")
        }

        items.forEach(fun(value: Int) {
            if (value == 2) return
            println("value: $value")
        })
        return 0
    }
}
