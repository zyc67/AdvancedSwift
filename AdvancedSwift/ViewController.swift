//
//  ViewController.swift
//  AdvancedSwift
//
//  Created by xuanxiaodi on 2025/7/4.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let str = "Fresh cheese in a breeze"
//        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
//        let allTheVowels = str.indices(where: { vowels.contains($0) })
//        print(allTheVowels)
//        let aaaa = str[allTheVowels]
//
//        print(str[allTheVowels])
//        print(str[allTheVowels].count)
        // [1, 2, 2, 2, 3, 4, 4]
        // [2, 2, 2, 3, 4, 4]
//        let array: [Int] = [1, 2, 2, 2, 3, 4, 4]
//        var result: [[Int]] = array.isEmpty ? [] : [[array[0]]] // [[1], [2, 2, 2], [3], [4, 4]]
//        let zipData = zip(array, array.dropFirst())
//        for (previous, current) in zipData {
//            if previous == current {
//                result[result.endIndex-1].append(current)
//            } else {
//                result.append([current])
//            }
//        }
//        print(result) // [[1], [2, 2, 2], [3], [4, 4]]
        
        // [10, 20, 30, 10, 40, 40, 10, 20]
        // [20, 30, 10, 40, 40, 10, 20]
        // [[10], [20], [30], [10], [40, 40], [10], [20]]
        
        
//        let fibs = [0, 1, 1, 2, 3, 5]
//        fibs.compactMap { <#Int#> in
//            <#code#>
//        }
//        fibs.flatMap { <#Int#> in
//            <#code#>
//        }
//        let flatMapped = fibs.flatMap { Array(repeating: $0, count: $0) }
//        fibs.indices
//        fibs.reduce([:], <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result##(_ partialResult: Result, Int) throws -> Result#>)
//        fibs.reduce(into: <#T##Result#>, <#T##updateAccumulatingResult: (inout Result, Int) throws -> ()##(inout Result, Int) throws -> ()##(_ partialResult: inout Result, Int) throws -> ()#>)
        
//        struct Person {
//            let name: String
//            let age: Int
//        }
//
//        let people = [
//            Person(name: "Alice", age: 25),
//            Person(name: "Bob", age: 30),
//            Person(name: "Charlie", age: 35)
//        ]
//
//        // 使用 reduce(into:) 构建分组字典
//        let groupedByAge = people.reduce(into: [String: [Person]]()) { acc, person in
//            let ageGroup = person.age < 30 ? "young" : "mature"
//            acc[ageGroup, default: []].append(person)
//        }
        
//        (1..<10).forEach { number in
//            print(number)
//            if number > 2 { return }
//            print("---------")
//        }
//        /*
//         1
//         ---------
//         2
//         ---------
//         3
//         4
//         5
//         6
//         7
//         8
//         9
//         */
        
//        let aaa = [("a", 1), ("b", 2), ("a", 3), ("b", 4), ("a", 5)]
//        let bbb = Dictionary(aaa) { (first, last) in
//            print(first, last)
//            return first + last
//        }
//        print(bbb)
//        
//        let ccc = [("a", 1), ("b", 2), ("a", 3), ("b", 4), ("a", 5)]
//        let ddd = Dictionary(ccc, uniquingKeysWith: { (first, _) in first })
//        print(ddd)
//        
//        let eee = [("a", 1), ("b", 2), ("a", 3), ("b", 4), ("a", 5)]
//        let fff = Dictionary(eee, uniquingKeysWith: { (_, last) in last })
//        print(fff)
        
//        var d1: [String : Any] = ["name": "ha", "age": 19]
//        var d2: [String : Any] = ["age": 20, "sex": "F"]
//        var d3 = d1.map { key, value in
//            "\(key) - \(value)"
//        }
//        var d4 = d1.mapValues { value in
//            "value - \(value)"
//        }
//        var d5 = d1.map { key, value in
//            1
//        }
//        print(d1) // ["name": "ha", "age": 19]
//        print(d3) // ["name - ha", "age - 19"]
//        print(d4) // ["age": "value - 19", "name": "value - ha"]
//        print(d5) // [1, 1]
//        
//        let apiResponse = [
//            "user_id": "12345",
//            "user_name": "John",
//            "user_age": "30",
//            "user_email": "john@example.com"
//        ]
//
//        // 转换API响应格式
//        let cleanedResponse = apiResponse.mapValues { value in
//            return value.replacingOccurrences(of: "user_", with: "")
//        }
//        print(cleanedResponse)
        
    
//        let frequencies = "hello".frequencies
//        print(frequencies)
        
//        var fruits: Set = ["Apple", "Banana"]
//
//        // 插入元素
//        fruits.insert("Orange")
        
//        let numbers: Set = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//
//        // 过滤
//        let evenNumbers = numbers.filter { $0 % 2 == 0 } // 返回数组
//        let evenSet = Set(numbers.filter { $0 % 2 == 0 }) // 转换回 Set
//
//        // 映射
//        let squaredNumbers = numbers.map { $0 * $0 } // 返回数组
//        let squaredSet = Set(numbers.map { $0 * $0 })
//
//        // 压缩映射
//        let validNumbers = numbers.compactMap { $0 > 5 ? $0 : nil }
//
//        // 归约
//        let sum = numbers.reduce(0, +)
//        let product = numbers.reduce(1, *)
//        
//        let fruits: Set = ["Apple", "Banana", "Cherry", "Date"]
//
//        // 检查是否所有元素都满足条件
//        let allLong = fruits.allSatisfy { $0.count > 3 }
//        
//        print(allLong)
//        
//        let emptyArray: [Int] = []
//        let result = emptyArray.allSatisfy { $0 > 100 }
//        print(result) // true
        
        struct Version: Comparable {
            let major: Int
            let minor: Int
            
            static func < (lhs: Version, rhs: Version) -> Bool {
                return (lhs.major, lhs.minor) < (rhs.major, rhs.minor)
            }
        }

        let versionRange = Version(major: 1, minor: 0)...Version(major: 2, minor: 5)
        let currentVersion = Version(major: 1, minor: 8)

        if versionRange.contains(currentVersion) {
            print("版本兼容")
        }
    }
}

extension Sequence where Element: Hashable {
    var frequencies: [Element:Int] {
        let frequencyPairs = self.map { ($0, 1) }
//        return Dictionary(frequencyPairs, uniquingKeysWith: +)
//        return Dictionary(frequencyPairs, uniquingKeysWith: { (first, _) in first })
//        Dictionary(<#T##keysAndValues: Sequence##Sequence#>, uniquingKeysWith: <#T##(Value, Value) throws -> Value#>)
        return Dictionary(frequencyPairs, uniquingKeysWith: { (_, last) in last })
    }
}

extension Array {
    func map<T>(_ transform: (Element) -> T) -> [T] {
        var result: [T] = []
        result.reserveCapacity(count)
        for x in self {
            result.append(transform(x))
        }
        return result
    }
}
// Fresh cheese  in a breeze
//   2     89 11 13 16  20 21 23

//public subscript(subranges: RangeSet<Index>) -> DiscontiguousSlice<String> { get }
//RangeSet<Index>

extension Array {
    func accumulate<Result>(_ initialResult: Result,
    _ nextPartialResult: (Result, Element) -> Result) -> [Result]
    {
        var running = initialResult
        return map { next in
            running = nextPartialResult(running, next)
            return running
        }
    }
}

//extension Array where Element: Equatable {
//    func firstIndex_foreach(of element: Element) -> Int? {
//        self.indices.filter { idx in
//            self[idx] == element
//        }.forEach { idx in
//            return idx
//        }
//        return nil
//    }
//}
