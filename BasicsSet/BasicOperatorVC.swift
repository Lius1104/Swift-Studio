//
//  BasicOperatorVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/7.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit
import Foundation

class BasicOperatorVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*
         var a = 10
         let b = 5
         a = b
         print(a)
         
         let (a1, b1) = (12, 6)
         print(a1)
         print(b1)
         
         let remind = -9 % 4 // % -b 和 % b的结果相同
         print(remind)
         
         // === 和 !== 用于判断两个对象是否引用同一个对象实例
         
         let name = "world"
         if name == "world" {
         print("hello, \(name)")
         } else {
         print("I'm sorry \(name), but I don't recognize you")
         }
         
         //        let result = (3, "apple") < (3, "bird")//元组比较，元素应少于7个，大于等于7个时需要自定义比较运算符
         let result = "zebra" < "apple" //字符串比大小：Unicode编码数值大小逐位比较
         
         print(result)
         // a ?? b => a != nil ? a! : b
         
         //闭区间运算符 a...b 包括 a 和 b
         //半开放区间运算符 a..<b 包括 a，不包括 b
         //单侧范围：[2...], [...2], [..<2], [..>2]
         //单侧范围检测特定值
         let range = ...5
         let result1 = range.contains(7)//false
         let result2 = range.contains(2)//true
         print(result1, result2)
         
         let quotation = """
         These are the same.
         """
         print(quotation)
         let softWrappedQuotation = """
         The White Rabbit put on his spectacles.  "Where shall I begin, \
         please your Majesty?" he asked.
         
         "Begin at the beginning," the King said gravely, "and go on \
         till you come to the end; then stop."
         """// 行尾的 \ 在代码中实现换行在运行时不体现，只是为了开发时优化代码格式
         print(softWrappedQuotation)
         /*
         The escaped special characters \0 (空字符，不是空格), \\ (反斜杠), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quotation mark) and \' (single quotation mark)
         An arbitrary Unicode scalar, written as \u{n}, where n is a 1–8 digit hexadecimal number with a value equal to a valid Unicode code point (Unicode is discussed in Unicode below)
         */
         let nonChar = ".\0."
         print(nonChar)
         
         let threeDoubleQuotationMarks = """
         Escaping the first quotation mark \"""
         Escaping all three quotation marks \"\"\"
         """
         print(threeDoubleQuotationMarks)
         
         // 空字符串
         let emptyString = ""
         let anoherEmptyString = String()
         
         if emptyString.isEmpty {
         print("Nothine to see here")
         }
         
         var variableString = "Horse"
         variableString += " and carriage"
         
         for character in "Dog!🐶" {
         print(character)
         }
         
         let exclamationMark: Character = "!"
         
         let catCharacter: [Character] = ["C", "a", "t", "!", "🐱"]
         var catString = String(catCharacter)
         print(catString)
         
         catString += variableString
         print(catString)
         catString.append(exclamationMark)
         print(catString)
         
         //Extended Grapheme Clusters
         let eAcute: Character = "\u{E9}"                         // é
         let combinedEAcute: Character = "\u{65}\u{301}"
         print(eAcute)
         print(combinedEAcute)
         
         let precomposed: Character = "\u{D55C}"                  // 한
         let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
         print(precomposed)
         print(decomposed)
         
         let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"// 🇺 and 🇸 == 🇺🇸
         print(regionalIndicatorForUS)
         
         //字符计数， 与 NSString length 不总是相同，计数基础不同：NSString 是基于 UTF-16编码的字符数量，string 是 Unicode 扩展字形集群
         let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
         print("unusualMenagerie has \(unusualMenagerie.count) characters")
         
         var word = "cafe"
         print("the number of characters in \(word) is \(word.count)")
         word += "\u{0301}"
         print("the number of characters in \(word) is \(word.count)")
         
         //访问 and 修改 字符串
         var word = "test_access_and_modify_String"
         print(word[word.startIndex])
         print(word[word.index(after: word.startIndex)])
         //        print(word[word.endIndex])//endIndex属性是String中最后一个字符后面的位置。
         print(word[word.index(before: word.endIndex)])
         
         let index  = word.index(word.startIndex, offsetBy: 7)
         print("\(word[index])")
         
         
         for index in word.indices {
         print("\(word[index])", terminator: " ")
         }
         
         //dic, array, set 索引
         let nameString = ["Lius", "Tom", "Jay", "Jack", "Sara"]
         print("\n\r\(nameString)")
         print("\(nameString[nameString.startIndex])")
         
         //插入 and 移除, array, dic, set 同样适用，与 string 同样 遵循 protocol RangeReplaceableCollection
         //        word.insert("X", at: index)
         //        print("\(word)")
         word.insert("!", at: word.endIndex)
         print("\(word)")
         word.insert(contentsOf: "Lius_", at: word.startIndex)
         print(word)
         word.remove(at: word.startIndex)
         print(word)
         let range = word.startIndex ... word.index(word.startIndex, offsetBy: 3)
         word.removeSubrange(range)
         print(word)
         
         //子字符串
         var greeting: String = "Hello, world!"
         print(greeting)
         //        let index = greeting.firstIndex(of: ",") ?? greeting.endIndex//firstIndex(of: ) error
         let index = greeting.index(greeting.startIndex, offsetBy: 5)
         var subStr = greeting[..<index]
         subStr += " Lius."
         print(subStr)
         print(greeting)
         
         let quotation = "We're a lot alike, you and I."
         let sameQuotation = "We're a lot alike, you and I."
         if quotation == sameQuotation {
         print("These two strings are considered equal")
         }
         print(quotation.hasSuffix("."))
         
         let romeoAndJuliet = [
         "Act 1 Scene 1: Verona, A public place",
         "Act 1 Scene 2: Capulet's mansion",
         "Act 1 Scene 3: A room in Capulet's mansion",
         "Act 1 Scene 4: A street outside Capulet's mansion",
         "Act 1 Scene 5: The Great Hall in Capulet's mansion",
         "Act 2 Scene 1: Outside Capulet's mansion",
         "Act 2 Scene 2: Capulet's orchard",
         "Act 2 Scene 3: Outside Friar Lawrence's cell",
         "Act 2 Scene 4: A street in Verona",
         "Act 2 Scene 5: Capulet's mansion",
         "Act 2 Scene 6: Friar Lawrence's cell"
         ]
         var count = 0
         for item in romeoAndJuliet {
         if item.hasPrefix("Act 1") {
         count += 1
         }
         }
         print(count)
         
         let dogString = "Dog‼🐶"
         for codeUnit in dogString.utf8 {
         print("\(codeUnit) ", terminator: "")
         }
         print("")
         for codeUnit in dogString.utf16 {
         print("\(codeUnit) ", terminator: "")
         }
         print("")
         for scalar in dogString.unicodeScalars {
         print("\(scalar.value) ", terminator: "")
         }
         print("")
         for scalar in dogString.unicodeScalars {
         print("\(scalar) ", terminator: "")
         }
         print("")
         */
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
