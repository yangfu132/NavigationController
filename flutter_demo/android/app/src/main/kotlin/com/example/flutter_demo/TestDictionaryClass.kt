package com.example.flutter_demo

import android.os.Build
import androidx.annotation.RequiresApi

class TestDictionaryClass {
    fun testDictionary() {
        testCreate()
        testValue()
        testPlusMinus()
        testModify()
        testRemove()
        testForIn()
        testTransform()
        testCount()
        testEmpty()
        testFilter()
    }

    fun testCreate() {
        println("++++++++++testCreate+++++++++")
        val someDict = mapOf("one" to 1, "two" to 2)
        println(someDict)
    }


    fun testValue() {
        println("++++++++++testValue+++++++++")
        val someDict = mapOf(1 to "one", 2 to "two", 3 to "three")
        val someVal  = someDict[1]
        val twoValue = someDict.get(2)
//        val threeValue = someDict.getOrDefault(3,"nil")
        println("key = 1, value = $someVal")
        println("key = 2, value = $twoValue")
//        println("key = 3, value = $threeValue")
        println("key = 1, value = ${someDict[1]}")
        println("key = 2, value = ${someDict[2]}")
        println("key = 3, value = ${someDict[3]}")
    }

    fun testPlusMinus() {
        println("++++++++++testModify+++++++++")
        val someDict = mutableMapOf(1 to "one", 2 to "two", 3 to "three")
        println(someDict + Pair(3, "four"))
        println(someDict + Pair(4, "four"))
        println(someDict + mutableMapOf(5 to "five"))
        println(someDict - Pair(4, "four"))
        println(someDict - mutableMapOf(5 to "five"))
        println(someDict - mutableMapOf(6 to "six"))
        println(someDict - listOf(1,2))
    }

    fun testModify() {
        println("++++++++++testModify+++++++++")
        val someDict = mutableMapOf(1 to "one", 2 to "two", 3 to "three")
        someDict.put(4,"four")
        println(someDict)
        someDict.putAll(setOf(5 to "five", 6 to "six"))
        println(someDict)

        val oldVal = someDict[1]
        someDict[1] = "one new"
        val someVar = someDict[1]
        println("1 key = 1 old, value = $oldVal")
        println("1 key = 1, value = $someVar")
        println("1 key = 2, value = ${someDict[2]} )")
        println("1 key = 3, value = ${someDict[3]}")
    }

    fun testRemove() {
        println("++++++++++testRemove+++++++++")
        var someDict = mutableMapOf(1 to "one", 2 to "two", 3 to "three")
        val removedValue = someDict.remove(2)
        println("removedValue, value = $removedValue")
        println("1 key = 1, value = ${someDict[1]})")
        println("1 key = 2, value = ${someDict[2]}")
        println("1 key = 3, value = ${someDict[3]}")

        someDict = mutableMapOf(1 to "one", 2 to "two", 3 to "three")
        println(someDict)
        someDict.keys.remove(1)
        println(someDict)

        someDict = mutableMapOf(1 to "one", 2 to "two", 3 to "three")
        println(someDict)
        someDict -= 1
    }

    fun testForIn() {
        println("++++++++++testForIn+++++++++")
        val someDict = mutableMapOf(1 to "one", 2 to "two", 3 to "three")
        for ((key,value ) in someDict) {
            print("someDict: key = $key, value = $value")
        }

        someDict += Pair(4, "four")
        for ((key,value ) in someDict) {
            print("someDict: key = $key, value = $value")
        }
    }

    fun testTransform() {
        println("++++++++++testTransform+++++++++")
        val someDict = mutableMapOf(1 to "one", 2 to "two", 3 to "three")
        val dictKeys = someDict.keys
        val dictValues = someDict.values

        print("输出字典的键(dictKeys)")
        for (key in dictKeys) {
            print("$key")
        }

        print("输出字典的值(dictValues)")
        for (value in dictValues) {
            print("value is $value")
        }
    }

    fun testCount() {
        println("++++++++++testCount+++++++++")
        val someDict1 = mutableMapOf(1 to "one", 2 to "two", 3 to "three")
        val someDict2 = mutableMapOf(4 to "four", 5 to "five")
        print("someDict1, count:${someDict1.count()}")
        print("someDict2, count:${someDict2.count()}")
    }

    fun testEmpty() {
        println("++++++++++testEmpty+++++++++")
        val someDict1 = mutableMapOf(1 to "one", 2 to "two", 3 to "three")
        val someDict2 = mutableMapOf(4 to "four", 5 to "five")
        val someDict3 = emptyMap<Int,String>()
        print("someDict1, isEmpty:${someDict1.isEmpty()}")
        print("someDict2, isEmpty:${someDict2.isEmpty()}")
        print("someDict3, isEmpty:${someDict3.isEmpty()}")
    }

    fun testFilter() {
        val someDict = mutableMapOf(1 to "one", 2 to "two", 3 to "three")
        val filteredKeysMap = someDict.filterValues { it.endsWith("1") }
        val filteredValuesMap = someDict.filterKeys { it < 10 }

        println(filteredKeysMap)
        println(filteredValuesMap)
    }
}