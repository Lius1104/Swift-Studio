//
//  FunctionsVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/15.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

class FunctionsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Functions"
        // Do any additional setup after loading the view.
        /*
         
         // 定义 调用 函数
         print(greet(person: "Lius"))
         print(greetAgain(person: "Sara"))
         
         // 函数参数 和 返回值
         /*
         *  1. 无参函数 : sayHelloWorld()
         *  2. 多参函数 : greet(person: <#T##String#>, alreadyGreeted: <#T##Bool#>)
         *  3. 多返回值函数(元组) : .
         */
         print(sayHelloWorld())
         print(greet(person: "ZYL", alreadyGreeted: true))
         //        greet(person: "L")
         
         print(printAndCount(string: "Hello, world!"))
         printWithoutCouting(string: "Hello, world!")
         
         // 元组作为返回值
         //        let bounds = minMax(array: [1, 3, 5, -2, 9])
         //        print("min is \(bounds.min) and max is \(bounds.max)")
         
         // 可选的元组返回类型 (Int, Int)?
         /*
         *  (Int, Int)? 与 (Int?, Int?) 不同：
         *  (Int, Int)? : 整个元组是可选的
         *  (Int?, Int?) : 元组中的单个项是可选的
         */
         if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
         print("min is \(bounds.min) and max is \(bounds.max)")
         } else {
         print("array is empty!")
         }
         
         // 函数参数标签，参数名称， 默认情况下，参数使用参数名称作为参数标签
         someFunction(firstParameterName: 1, secondParameterName: 2)
         // 指定参数标签
         anotherFunction(argumentLabel: 2)
         print(greet(person: "Lius", from: "China"))
         // 省略参数标签 参数名称前加 _
         someFunction(1, secondParameterName: 2)
         // 默认参数值
         someFunction(firstParameterName: 6, secondParameterName: 9)
         someFunction(firstParameterName: 1)
         // 变量参数 : 可变参数接受一个或多个指定类型的值，在参数类型名称后写入...
         // 一个函数最多只能有一个可变参数
         print("the average value is \(arithmeticMean(1.2, 3.2, 5.2, 4.5))")
         // In-Out 参数，不能有默认值，不能是可变参数
         var someInt = 3
         var anotherInt = 107
         print("someInt is now \(someInt), and anotherInt is now \(anotherInt).")
         swapTwoInts(&someInt, &anotherInt)
         print("someInt is now \(someInt), and anotherInt is now \(anotherInt).")
         // 函数类型
         var mathFunction: (Int, Int) -> Int = addTwoInts
         print("mathFunction(2, 3) is \(mathFunction(2, 3)).")
         mathFunction = multiplyTwoInts
         print("mathFunction(2, 3) is \(mathFunction(2, 3)).")
         let anotherFunc = addTwoInts
         print("another func result is \(anotherFunc(2, 3)).")
         
         // 函数类型作为参数类型
         printMathResult(mathFunction, 2, 3)
         // 函数类型作为返回值
         var currentValue = 3
         let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
         print("Couting to zero:")
         while currentValue > 0 {
         print("\(currentValue)...")
         currentValue = moveNearerToZero(currentValue)
         }
         print("Zero!")
         */
        
        // 嵌套函数
        var currentValue = -5
        let moveNearerToZero = chooseStepFunction(currentValue > 0)
        print("counting to zero:")
        while currentValue != 0 {
            print("\(currentValue)...")
            currentValue = moveNearerToZero(currentValue)
        }
        print("zero!")
        
    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    func sayHelloWorld() -> String {
//        return "hello, world"
//    }
//
//    func greet(person: String, alreadyGreeted: Bool) -> String {
//        if alreadyGreeted {
//            return greetAgain(person: person)
//        } else {
//            return greet(person: person)
//        }
//    }
//
//    func greet(person: String) -> String {
//        let greeting = "Hello, " + person + "!"
//        return greeting
//    }
//
//    func greet(person: String) {
//        print("Hello, \(person)!")
//    }
//
//    func greetAgain(person: String) -> String {
//        return "Hello again, " + person + "!"
//    }
//
//    func printAndCount(string: String) -> Int {
//        print(string)
//        return string.count
//    }
//
//    func printWithoutCouting(string: String) {
//        let _ = printAndCount(string: string)
//
//    }
//
//    func minMax(array: [Int]) -> (min: Int, max: Int) {
//        var currentMin = array[0]
//        var currentMax = array[0]
//        for value in array {
//            if value < currentMin {
//                currentMin = value
//            }
//            if value > currentMax {
//                currentMax = value
//            }
//        }
//        return (currentMin, currentMax)
//    }
//
//    func minMax(array: [Int]) -> (min: Int, max: Int)? {
//        if array.isEmpty {
//            return nil
//        }
//        var currentMin = array[0]
//        var currentMax = array[0]
//        for value in array {
//            if value < currentMin {
//                currentMin = value
//            }
//            if value > currentMax {
//                currentMax = value
//            }
//        }
//        return (currentMin, currentMax)
//    }
//
//    func someFunction(firstParameterName: Int, secondParameterName: Int) {
//    }
//
//    func anotherFunction(argumentLabel parameterName: Int) {
//    }
//
//    func greet(person: String, from hometown: String) -> String {
//        return "Hello \(person)!  Glad you could visit from \(hometown)."
//    }
//
//    func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
//    }
//
//    func someFunction(firstParameterName: Int, secondParameterName: Int = 12) {
//        print("first number is \(firstParameterName), second number is \(secondParameterName).")
//    }
//
//    func arithmeticMean(_ numbers: Double...) -> Double {
//        var total: Double = 0
//        for number in numbers {
//            total += number
//        }
//        return total / Double(numbers.count)
//    }
//
//    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
//        let temp = a
//        a = b
//        b = temp
//    }
    
//    func addTwoInts(_ a: Int, _ b: Int) -> Int {
//        return a + b
//    }
//
//    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
//        return a * b
//    }
//
//    func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
//        print("math function result is \(mathFunction(a, b))")
//    }

//    func stepForward(_ input: Int) -> Int {
//        return input + 1
//    }
//
//    func stepBackward(_ input: Int) -> Int {
//        return input - 1
//    }
//
//    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
//        return backward ? stepBackward : stepForward
//    }
    
    func chooseStepFunction(_ backward: Bool) -> (Int) -> Int {
        func stepForward(_ a: Int) -> Int {
            return a + 1
        }
        func stepBackward(_ a: Int) -> Int {
            return a - 1
        }
        return backward ? stepBackward : stepForward
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
