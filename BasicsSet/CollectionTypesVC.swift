//
//  CollectionTypesVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/14.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

class CollectionTypesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*
         
         //创建空数组
         var someInts = [Int]()
         print("someInts is of type [Int] with \(someInts.count) items.")
         someInts.append(4)
         someInts = []// someInts is now an empty array, but is still of type [Int]
         
         //创建有默认值的数组
         let threeDoubles = Array(repeating: 0.0, count: 3)
         print(threeDoubles)
         let anotherThreeDoubles = Array(repeating: 2.5, count: 3)
         print(anotherThreeDoubles)
         let sixDoubles = threeDoubles + anotherThreeDoubles
         print(sixDoubles)
         
         //使用简便方法创建数组
         //        var shoppingList: [String] = ["Eggs", "Milk", "Noodles"]
         var shoppingList = ["Eggs", "Milk", "Noodles"]
         print(shoppingList)
         
         shoppingList.append("Yogurt")
         print(shoppingList)
         
         var intArray = [1, 2, 3]
         print(intArray)
         
         //访问和修改数组
         print("The shopping list contains \(shoppingList.count) items.")
         if shoppingList.isEmpty {
         print("The shopping list is empty.")
         } else {
         print("The shopping list is not empty.")
         }
         
         shoppingList += ["Baking Powder"]
         print(shoppingList)
         
         shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
         print(shoppingList)
         print("The shopping list contains \(shoppingList.count) items.")
         
         print(shoppingList[0])
         shoppingList[0] = "Six Eggs"
         print(shoppingList)
         
         shoppingList.insert("Maple Syrup", at: 0)
         print(shoppingList)
         
         let mapleSyrup = shoppingList.remove(at: 0)
         print(mapleSyrup)
         print(shoppingList)
         
         print("\n")
         
         shoppingList.removeFirst()
         print(shoppingList)
         shoppingList.removeLast()
         print(shoppingList)
         
         //        shoppingList.removeAll()
         //        print(shoppingList)
         
         
         for item in shoppingList {
         print("\(item) ", terminator: "")
         }
         print("")
         for (index, item) in shoppingList.enumerated() {
         print("Item \(index + 1): \(item).")
         }
         
         //Sets
         //创建空集合
         var letters = Set<Character>()
         print("letters is of type Set<Character> with \(letters.count) items")
         letters.insert("a")
         print(letters)
         
         //        var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
         var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
         print(favoriteGenres)
         print("I have \(favoriteGenres.count) favorite music genres.")
         
         if favoriteGenres.isEmpty {
         print("As far as music gose, I'm not picky.")
         } else {
         print("I have particular music preferences.")
         }
         
         favoriteGenres.insert("Jazz")
         print(favoriteGenres)
         
         if let removeGenres = favoriteGenres.remove("Rock") {
         print("\(removeGenres)? I'm over it.")
         } else {
         print("I never much cared for that.")
         }
         
         if favoriteGenres.contains("Funk") {
         print("I get up on the good foot.")
         } else {
         print("It's too funky in here.")
         }
         
         for item in favoriteGenres {
         print("\(item)")
         }
         
         for item in favoriteGenres.sorted() {
         print("\(item)")
         }
         
         //集合运算
         let oddDigits: Set = [1, 3, 5, 7, 9]
         let evenDigits: Set = [0, 2, 4, 6, 8]
         let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
         var result = oddDigits.symmetricDifference(evenDigits)
         print(result.sorted())
         result = oddDigits.intersection(singleDigitPrimeNumbers)//交集
         print(result.sorted())
         result = oddDigits.union(singleDigitPrimeNumbers)//并集
         print(result.sorted())
         result = oddDigits.subtracting(singleDigitPrimeNumbers)
         print(result.sorted())
         
         let houseAnimals: Set = ["🐶", "🐱"]
         let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
         let cityAnimals: Set = ["🐦", "🐭"]
         
         print(houseAnimals.isSubset(of: farmAnimals))//house 是否是 farm 的子集
         print(houseAnimals.isStrictSubset(of: farmAnimals))// house 是否是 farm 的子集 ，但是不相同
         print(farmAnimals.isSuperset(of: houseAnimals))//house 是否是 farm 的超集
         print(farmAnimals.isDisjoint(with: cityAnimals))// house 和 farm 是否没有共同项
         */
        
        //Dictionary
        //创建空字典
//        var dic = [Int: String]()
//        var dic: [String: String] = ["name": "Lius", "birthday": "1104"]
        var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        print(airports)
        print("The airports dictionary contains \(airports.count) items.")
        print("The airports dictionary contains \(airports.keys)")

        if airports.isEmpty {
            print("airport dictionary is empty.")
        } else {
            print("airports dictionary is not empty.")
        }
        airports["LHR"] = "London"
        print(airports)
        airports["LHR"] = "London Heathrow"
        print(airports)
        
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
            print("The old value for DUB was \(oldValue).")
            print("The new value for DUB is \(airports["DUB"]!)")
        }
        
        if let airportName = airports["DUB"] {
            print("The name of the airport is \(airportName).")
        } else {
            print("That airport is not in the airports dictionary.")
        }

        airports["APL"] = "Apple International"
        print(airports)
        airports["APL"] = nil
        print(airports)
        
        if let removeValue = airports.removeValue(forKey: "DUB") {
            print("The removed airport is \(removeValue).")
        } else {
            print("The airports dictionary does not contain a value for DUB.")
        }
        
        for (airportCode, airportName) in airports {
            print("\(airportCode) : \(airportName).")
        }
        
        for airportCode in airports.keys {
            print("\(airportCode) ", terminator: "")
        }
        print("")
        for airportName in airports.values {
            print("\(airportName) ", terminator: "")
        }
        print("")
        
        let airportNames = [String](airports.values)
        print(airportNames.sorted())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
