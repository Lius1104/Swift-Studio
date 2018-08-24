//
//  TypeCastingVC.swift
//  BasicsSet
//
//  Created by Shuang Lau on 2018/8/24.
//  Copyright © 2018年 Shuang Lau. All rights reserved.
//

import UIKit

class TypeCastingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "类型转换"//
        // 关键字：is (检查值的类型), as (将值转化成其他类型)
        // Do any additional setup after loading the view.
        
        // 1. 为类型转换定义类层次结构
        let library = [
            Movie(name: "Casablanca", director: "Michael Curtiz"),
            Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
            Movie(name: "Citizen Kane", director: "Orson Welles"),
            Song(name: "The One And Only", artist: "Chesney Hawkes"),
            Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
        ]// library = [MediaItem]()
        
        // 2. 检查类型 is
        var movieCount = 0
        var songCount = 0
        
        for item in library {
            if item is Movie {
                movieCount += 1
            }
            if item is Song {
                songCount += 1
            }
        }
        print("movie count is \(movieCount), song count is \(songCount).\n")
        // 3. 向下转换 as? (结果为可选值) , as! (强制转换，如果类型错误会发生运行时错误)
        for item in library {
            if let movie = item as? Movie {
                print("Movie: \(movie.name), dir.\(movie.director).")
            } else if let song = item as? Song {
                print("Song : \(song.name), by \(song.artist).")
            }
        }
        print("")
        // 4. Any / AnyObject 类型转换
        // Any : 可以代表任何类型的实例，包含函数类型
        var things = [Any]()
        things.append(0)
        things.append(0.0)
        things.append(42)
        things.append(3.14159)
        things.append("hello")
        things.append((3.0, 5.0))
        things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
        things.append({ (name: String) -> String in "Hello, \(name)" })
        // 在 switch 语句中，使用 is 或 as 检查类型
        for thing in things {
            switch thing {
//            case 0 as Int:
//                print("zero as an Int")
//            case 0 as Double:
//                print("zero as a Double")
            case let someInt as Int:
                print("an integer value of \(someInt)")
            case let someDouble as Double where someDouble > 0:
                print("a positive double value of \(someDouble)")
            case is Double:
                print("some other double value that I don't want to print")
            case let someString as String:
                print("a string value of \"\(someString)\"")
            case let (x, y) as (Double, Double):
                print("an (x, y) point at \(x), \(y)")
            case let movie as Movie:
                print("a movie called \(movie.name), dir. \(movie.director)")
            case let stringConverter as (String) -> String:
                print(stringConverter("Michael"))
            default:
                print("something else")
            }
        }
        // 可选值作为Any的值，编译器警告，如果非要将可选项作为 Any 的值，可以使用 as 进行转化
        let optionalNumber: Int? = 3
        things.append(optionalNumber)// Expression implicitly coerced from 'Int?' to 'Any'
        // 两种解决办法:
        // a. 提供一个默认值
        things.append(optionalNumber ?? 3)
        // 已经有默认值的强制解包
        things.append(optionalNumber!)
        // b. Explicitly cast to 'Any' with 'as Any' to silence this warning
        things.append(optionalNumber as Any)
        // AnyObject : 可以代表任何类类型的实例
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

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
    
}
