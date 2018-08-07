//
//  BasicsVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/6.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

typealias AudioSample = UInt16
class BasicsVC: UIViewController {

    var x = 1.2, y = 3, z = "Lius"
//    let a = "Sara", b = 2, c = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*
         var a, b, c: String
         print(x, y, z)
         a = "Child"
         b = "Teacher"
         c = "Other"
         print(a, b, c)
         
         let number = Int8.min
         print(number)
         let otherNum = 1.25e2// 1.25 * 10 * 10
         print(otherNum)
         let hexNum = 0xC.3p0// (12 + 3/16) * 2^0
         print(hexNum)
         
         let totalNum = Int8(otherNum) + number
         print(totalNum)
         
         let hexNum = AudioSample.max
         print(hexNum)
         
         //元组(小范围内的临时值)
         let http404Error = (404, "Not Found", "http")
         print(http404Error)
         let (statusCode, statusMsg, _) = http404Error
         print("The status code is \(statusCode)")
         print("The status message is \(statusMsg)")
         let (justTheStatusCode, _, _) = http404Error
         print("The status code is \(justTheStatusCode)")
         print("The request type is \(http404Error.2)")
         let http2005Error = (statusCode: 200, description: "OK")
         print(http2005Error.statusCode)
         
         //可选项 optional
         let possibleNumber = "123"
         let convertedNumber = Int(possibleNumber)
         print(convertedNumber!)// ! 强行解包
         
         //nil 与 optional 同时使用，nil是缺省值，基本数据类型也可以使用，仅表示无值
         if convertedNumber != nil {
         print("convertedNumber has an integer value of \(convertedNumber!).")
         }
         if let num = Int(possibleNumber) {
         print("convertedNumber has an integer value of \(num).")
         } else {
         print("\"\(possibleNumber)\" could not be converted to an integer")
         }
         if var num = Int(possibleNumber) {
         num += 1
         print(num)
         } else {
         print("\"\(possibleNumber)\" could not be converted to an integer")
         }
         
         //在if中创建的可选绑定只能在if中使用, else 用不了
         if let firstNum = Int("4"), let secondNum = Int("42"), firstNum < secondNum && secondNum < 100 {
         print("Lius")
         }
         
         //隐式解包，确定之后都会有值用可以使用！
         let possibleString: String? = "An optional string."
         let forcedString: String = possibleString!
         print(forcedString)
         
         let assumedString: String! = "An implicitly unwrapped optional string."
         let implicitString: String = assumedString
         print(implicitString)
         
         //throws
         do {
         try canThrowError()
         } catch {
         // an error was thrown
         }
         
         // 断言
         let age = -3
         assert(age >= 0, " person's age can't be less than zero.")
         if age > 10 {
         print("You can ride the roller-coaster or the ferris wheel.")
         } else if age > 0 {
         print("You can ride the ferris wheel.")
         } else {
         assertionFailure("A person's age can't be less than zero.")
         }
         //前置条件
         let index = -3
         precondition(index > 0, "Index must be greater than zero.")
         
         fatalError("Index must be greater than zero.")//可以创建为时间功能的存根，总会执行这行代码
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func canThrowError() throws {
        //
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
