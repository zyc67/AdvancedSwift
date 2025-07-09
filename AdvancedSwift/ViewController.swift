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
        
        var d1: [String : Any] = ["name": "ha", "age": 19]
        var d2: [String : Any] = ["age": 20, "sex": "F"]
        var d3 = d1.map { key, value in
            "\(key) - \(value)"
        }
        var d4 = d1.mapValues { value in
            "value - \(value)"
        }
        var d5 = d1.map { key, value in
            1
        }
        print(d1) // ["name": "ha", "age": 19]
        print(d3) // ["name - ha", "age - 19"]
        print(d4) // ["age": "value - 19", "name": "value - ha"]
        print(d5) // [1, 1]
        
        let apiResponse = [
            "user_id": "12345",
            "user_name": "John",
            "user_age": "30",
            "user_email": "john@example.com"
        ]

        // 转换API响应格式
        let cleanedResponse = apiResponse.mapValues { value in
            return value.replacingOccurrences(of: "user_", with: "")
        }
        print(cleanedResponse)
        
    
//        let frequencies = "hello".frequencies
//        print(frequencies)
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
