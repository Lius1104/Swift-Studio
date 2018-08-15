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
         
         */
        // 定义 调用 函数
        print(greet(person: "Lius"))
        print(greetAgain(person: "Sara"))
        
        // 函数参数 和 返回值
        /*
         *  1. 无参函数 : sayHelloWorld()
         *  2. 多参函数 : greet(person: <#T##String#>, alreadyGreeted: <#T##Bool#>)
         */
        print(sayHelloWorld())
        print(greet(person: "ZYL", alreadyGreeted: true))
        greet(person: "L")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sayHelloWorld() -> String {
        return "hello, world"
    }
    
    func greet(person: String, alreadyGreeted: Bool) -> String {
        if alreadyGreeted {
            return greetAgain(person: person)
        } else {
            return greet(person: person)
        }
    }
    
    func greet(person: String) -> String {
        let greeting = "Hello, " + person + "!"
        return greeting
    }
    
    func greet(person: String) {
        print("Hello, \(person)!")
    }
    
    func greetAgain(person: String) -> String {
        return "Hello again, " + person + "!"
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
