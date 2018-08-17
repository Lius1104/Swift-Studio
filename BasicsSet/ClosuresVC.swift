//
//  ClosuresVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/16.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

class ClosuresVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "闭包"
        // Do any additional setup after loading the view.
//         相当于 block
        /*
         
         */
        // 闭包表达式
        // 排序 方法
        // 内联闭包
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        var reversedNames = names.sorted(by: backward) // s1 > s2
        print(reversedNames)
        
        // 闭包表达式 语法
        // 闭包的参数可以是 In-Out参数，但不能有默认值
        reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
            return s1 < s2
        })
        print(reversedNames)
        
        // 从上下文推断类型
        // 当 closure 作为 函数 or 方法 的 参数时 不需要提供完整的形式
        reversedNames = names.sorted(by: { (s1, s2) -> Bool in
            return s1 > s2
        })
        print(reversedNames)
        
        reversedNames = names.sorted(by: { s1, s2 in return s2 > s1 })
        print(reversedNames)
        
        // 单表达式闭包的隐式返回，不用写 return
        // 单表达式闭包 : 闭包内只有一个语句
        reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
        print(reversedNames)
        
        // 速记参数名称
        reversedNames = names.sorted(by: { $0 < $1 })
        print(reversedNames)
        
        // 操作方法
        reversedNames = names.sorted(by: >)
        print(reversedNames)
        
        // Trailing Closures
        someFunctionThatTakesAClosure(closure: {
//             closure's body goes here
        })
        someFunctionThatTakesAClosure {
            // closure's body goes here
        }
        
        reversedNames = names.sorted() { $0 < $1 }
        print(reversedNames)
        
        reversedNames = names.sorted { $0 > $1}
        print(reversedNames)
        
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        let strings = numbers.map { (number) -> String in
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            return output
        }
        print(strings)
        
        let dismantlings = numbers.map { (number) -> [Int] in
            var nums = [Int]()
            var number = number
            while number > 0 {
                nums.insert(number % 10, at: 0)
                number = number / 10
            }
            return nums
        }
        print(dismantlings)
        
        // 捕获上下文的常量变量
        let incrementer = makeIncrementer(forIncrementer: 10)
        print("\(incrementer())")
        print("\(incrementer())")
        print("\(incrementer())")
        let incrementerBySeven = makeIncrementer(forIncrementer: 7)
        print("\(incrementer())")
        print("\(incrementerBySeven())")
        
        // 闭包是引用类型
        let alsoIncrementerByTen = incrementer
        print("\(alsoIncrementerByTen())")
        
        // 转义闭包 隐式引用 self
        let instance = SomeClass()
        instance.doSomeThing()
        print(instance.x)
        
        completionHandlers.first?()
        print(instance.x)
        
        // Autoclosures
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)
        let customerProvider = { customersInLine.remove(at: 0) }//闭包 () -> String, 没有参数，remove 的返回值是 String
        print(customersInLine.count)
        // 在调用 闭包 之前 remove 不会调用，所以 custonersInLine.count = 5
        print("Now serving \(customerProvider())!")
        print(customersInLine.count)
        // 不使用 @autoclosure 显式调用闭包 { customersInLine.remove(at: 0) }
        serve(customer: { customersInLine.remove(at: 0) })
        print(customersInLine.count)
        // 使用 @autoclosure 隐式调用闭包 可以像调用 String 参数一样调用 闭包
        // 不要过度使用 @autoclosure 会增加上下文阅读难度
        anotherServe(customer: customersInLine.remove(at: 0))
        print(customersInLine.count)
        
        print(customersInLine)
        
        collectCustomerProviders(customersInLine.remove(at: 0))
        collectCustomerProviders(customersInLine.remove(at: 0))
        
        print("Collected \(customerProviders.count) closures.")
        
        for customerProvider in customerProviders {
            print("Now serving \(customerProvider())")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backward(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }

    func someFunctionThatTakesAClosure(closure: () -> Void) {
        print("some function that take a closure.")
    }
    
    func makeIncrementer(forIncrementer amount: Int) -> () -> Int {
        var runningTotal = 0
        func increment() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return increment
    }
    
    func serve(customer customerProvider: () -> String) {
        print("Now Serving \(customerProvider())")
    }
    
    func anotherServe(customer customerProvider: @autoclosure () -> String) {
        print("Now another serving \(customerProvider())")
    }
    
}

// 转义闭包，关键字: @escaping 转义作用域
// 使用 @escaping => 必须在闭包中明确使用 self
// 方式 : 通过存储在定义在函数外部的变量中
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    //不使用 @escaping 关键字 completionHandler 的作用域只在function内，无法将 completionHandler 加入到 completionHandlers 数组中，使用 @escaping 后转义作用域可以将 completionHandler 加入到 completionHandlers 数组中
    completionHandlers.append(completionHandler)
}
func someFunctionWithNonescapngClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomeThing() {
        // 调用闭包之前，内部代码不会执行
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNonescapngClosure {
            x = 200
        }
    }
}


var customerProviders: [() -> String] = []//闭包数组
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

