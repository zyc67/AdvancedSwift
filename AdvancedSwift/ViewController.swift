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
//        fibs.reduce([:], <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result##(_ partialResult: Result, Int) throws -> Result#>)
//        fibs.reduce(into: <#T##Result#>, <#T##updateAccumulatingResult: (inout Result, Int) throws -> ()##(inout Result, Int) throws -> ()##(_ partialResult: inout Result, Int) throws -> ()#>)
        
        struct Person {
            let name: String
            let age: Int
        }

        let people = [
            Person(name: "Alice", age: 25),
            Person(name: "Bob", age: 30),
            Person(name: "Charlie", age: 35)
        ]

        // 使用 reduce(into:) 构建分组字典
        let groupedByAge = people.reduce(into: [String: [Person]]()) { acc, person in
            let ageGroup = person.age < 30 ? "young" : "mature"
            acc[ageGroup, default: []].append(person)
        }
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
