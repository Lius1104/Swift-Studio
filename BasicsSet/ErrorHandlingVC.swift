//
//  ErrorHandlingVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/24.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

class ErrorHandlingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
        
        var vendingMachine = VendingMachine()
        vendingMachine.coinsDeposited = 8
        do {
            try buyFavriteSnack(person: "Alice", vendingmachine: vendingMachine)
            print("Success! Yum.")
        } catch VendingMachneError.invalidSelection {
            print("Invalid Selection.")
        } catch VendingMachneError.outOfStock {
            print("Out of Stock.")
        } catch VendingMachneError.insufficientFunds(let coinsNeeded) {
            print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
        } catch {
            print("Unexpected error: \(error).")
        }
        
        do {
            try nourish(with: "Beet-Flavored Chips", vendingMachine: vendingMachine)
        } catch {
            print("Unexpected non-vending-machine-related error: \(error)")
        }
        
        let x = try?vendingMachine.vend(itemName: "Alice")// try? 将错误转化成可选值
//        let y = try!vendingMachine.vend(itemName: "Alice")// try? 禁用错误传播
        
        // defer 代码块的执行顺序为倒叙，第一个defer的执行顺序，在没有异常处理的方法中也可以使用
        
    }
    
    let favoriteSnacks = [
        "Alice": "Chips",
        "Bob": "Licorice",
        "Eve": "Pretzels",
        ]
    
    func buyFavriteSnack(person: String, vendingmachine: VendingMachine) throws {
        let snackName = favoriteSnacks[person] ?? "Candy Bar"
        try vendingmachine.vend(itemName: snackName)
        
    }

    func nourish(with item: String, vendingMachine: VendingMachine) throws {
        do {
            try vendingMachine.vend(itemName: item)
        } catch is VendingMachneError {
            print("Invalid selection, out of stock, or not enough money.")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

enum VendingMachneError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}


func canThrowErrors() throws -> String {
    return ""
}

func cannotThrowErrors() -> String {
    return ""
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func vend(itemName name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachneError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachneError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachneError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("Dispensing \(name)")
        
    }
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemName: name)
        self.name = name
    }
    
}
