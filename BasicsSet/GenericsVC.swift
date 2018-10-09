//
//  GenericsVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/29.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

class GenericsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "泛型"
        // Do any additional setup after loading the view.
        var someInt = 3
        var anotherInt = 107
        swapTwoValue(&someInt, &anotherInt)
        print("\(someInt), \(anotherInt).")
        
        var someString = "hello"
        var anotherString = "world"
        swapTwoValue(&someString, &anotherString)
        print("\(someString), \(anotherString).")
        
        var stackOfStrings = Stack<String>()
        stackOfStrings.push("uno")
        stackOfStrings.push("dos")
        stackOfStrings.push("tres")
        stackOfStrings.push("cuatro")
        print(stackOfStrings.items)
        let fromTheTop = stackOfStrings.pop()
        print(fromTheTop)
        
        if let topItem = stackOfStrings.topItem {
            print("The top item on the stack is \(topItem).")
        } else {
            print("stackOfStrings is empty.")
        }
        
        let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
        if let foundIndex = findIndex(of: "llama", in: strings) {
            print("The index of llama is \(foundIndex)")
        }
        
        let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
        let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
        print("\(doubleIndex), \(stringIndex).")
    }
    

    func swapTwoValue<T>(_ a: inout T, _ b: inout T) {
        let temp = a
        a = b
        b = temp
    }
    
}

//struct IntStack {
//    var items = [Int]()
//    mutating func push(_ item: Int) {
//        items.append(item)
//    }
//    mutating func pop() -> Int {
//        return items.removeLast()
//    }
//}



// 泛型的扩展
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    
}

// 类型约束
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    //
}

func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

// 相关类型
protocol Contrainer {
    associatedtype Item: Equatable
    mutating func append(_ item : Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntStack: Contrainer {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
    
}

//extension Array: Contrainer {}

// 将约束添加到关联类型
protocol SuffixableContainer: Contrainer {
//    associatedtype
}
