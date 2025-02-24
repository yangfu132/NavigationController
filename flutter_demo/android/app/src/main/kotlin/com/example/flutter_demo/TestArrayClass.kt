package com.example.flutter_demo

class TestArrayClass {
    fun testArray() {
        testCreate()
        testForIn()
        testMerge()
        testCount()
        testEmpty()
    }
    fun testCreate(){
        val a = arrayOf(1,2,3)
        val b = Array(3,{i -> (i*2)})
        println("a is $a, first is $a[0]")
        println("b is $b, first is $b[9]")

        val x:IntArray = intArrayOf(1,2,3)
        x[0] = x[1] + x[2]
        println("x is $x, first is $x[9]")
    }

    fun testForIn() {
        val a = arrayOf(1,2,3)
        for (item in a) {
            println("item is $item")
        }

        for(index in a.indices) {
            println("index is $index, item is ${a[index]}")
        }
    }

    fun testMerge(){
        val a = arrayOf(1,2,3)
        val b = arrayOf(4,5,6)
        val c = a + b
        println("c is $c, first is ${c[4]}")
    }

    fun testCount() {
        val c = arrayOf(1,2,3)
        println("c is $c, count is ${c.count()}")
    }

    fun testEmpty(){
        val a = emptyArray<Int>()
        val c = arrayOf(1,2,3)
        println("a is $a, ${a.isEmpty()}}")
        println("c is $c, ${c.isEmpty()}}")
    }

}