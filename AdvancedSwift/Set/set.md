# Swift Set 用法详解

## 1. Set 基础概念

Set 是 Swift 中的一种集合类型，用于存储相同类型的唯一值，且这些值没有明确的顺序。Set 的核心特点：
- **唯一性**：不允许重复元素
- **无序性**：元素没有固定的顺序
- **快速查找**：基于哈希表实现，查找、插入、删除操作都是 O(1) 平均时间复杂度

## 2. 创建 Set

### 2.1 基本创建方式

```swift
// 空 Set
var emptySet = Set<String>()
var anotherEmptySet: Set<String> = []

// 使用数组字面量创建
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

// 类型推断
var fruits: Set = ["Apple", "Banana", "Orange"]

// 使用 Set 初始化器
var numbers = Set([1, 2, 3, 4, 5])
var uniqueNumbers = Set([1, 1, 2, 2, 3, 3]) // 结果：{1, 2, 3}
```

### 2.2 从其他集合创建

```swift
let array = [1, 2, 3, 2, 1, 4]
let setFromArray = Set(array) // {1, 2, 3, 4}

let sequence = 1...5
let setFromRange = Set(sequence) // {1, 2, 3, 4, 5}
```

## 3. 基本操作

### 3.1 访问和查询

```swift
var fruits: Set = ["Apple", "Banana", "Orange"]

// 获取元素数量
print(fruits.count) // 3

// 检查是否为空
print(fruits.isEmpty) // false

// 检查是否包含某个元素
print(fruits.contains("Apple")) // true
print(fruits.contains("Grape")) // false

// 遍历
for fruit in fruits {
    print(fruit)
}

// 排序遍历
for fruit in fruits.sorted() {
    print(fruit)
}
```

### 3.2 添加和删除元素

```swift
var fruits: Set = ["Apple", "Banana"]

// 插入元素
fruits.insert("Orange")
print(fruits) // {"Apple", "Banana", "Orange"}

// 插入已存在的元素（无效果）
let (inserted, memberAfterInsert) = fruits.insert("Apple")
print(inserted) // false (因为已存在)
print(memberAfterInsert) // "Apple"

// 删除元素
if let removedFruit = fruits.remove("Banana") {
    print("Removed: \(removedFruit)")
}

// 删除不存在的元素
let result = fruits.remove("Grape") // 返回 nil

// 删除所有元素
fruits.removeAll()

// 删除第一个元素（随机）
var numbers: Set = [1, 2, 3, 4, 5]
if let first = numbers.removeFirst() {
    print("Removed first: \(first)")
}
```

## 4. Set 运算

### 4.1 交集运算 (Intersection)

```swift
let setA: Set = [1, 2, 3, 4]
let setB: Set = [3, 4, 5, 6]

// 交集：两个集合中都存在的元素
let intersection = setA.intersection(setB) // {3, 4}

// 原地交集操作
var mutableSet = setA
mutableSet.formIntersection(setB)
print(mutableSet) // {3, 4}
```

### 4.2 并集运算 (Union)

```swift
let setA: Set = [1, 2, 3]
let setB: Set = [3, 4, 5]

// 并集：两个集合中所有元素的组合
let union = setA.union(setB) // {1, 2, 3, 4, 5}

// 原地并集操作
var mutableSet = setA
mutableSet.formUnion(setB)
print(mutableSet) // {1, 2, 3, 4, 5}
```

### 4.3 差集运算 (Subtraction)

```swift
let setA: Set = [1, 2, 3, 4]
let setB: Set = [3, 4, 5, 6]

// 差集：setA 中有但 setB 中没有的元素
let subtraction = setA.subtracting(setB) // {1, 2}

// 原地差集操作
var mutableSet = setA
mutableSet.subtract(setB)
print(mutableSet) // {1, 2}
```

### 4.4 对称差集 (Symmetric Difference)

```swift
let setA: Set = [1, 2, 3, 4]
let setB: Set = [3, 4, 5, 6]

// 对称差集：两个集合中不重复的元素
let symmetricDifference = setA.symmetricDifference(setB) // {1, 2, 5, 6}

// 原地对称差集操作
var mutableSet = setA
mutableSet.formSymmetricDifference(setB)
print(mutableSet) // {1, 2, 5, 6}
```

## 5. Set 关系判断

### 5.1 相等性和包含关系

```swift
let setA: Set = [1, 2, 3]
let setB: Set = [3, 2, 1] // 顺序不重要
let setC: Set = [1, 2]
let setD: Set = [1, 2, 3, 4]

// 相等判断
print(setA == setB) // true

// 是否为子集
print(setC.isSubset(of: setA)) // true
print(setA.isSubset(of: setC)) // false

// 是否为超集
print(setA.isSuperset(of: setC)) // true
print(setC.isSuperset(of: setA)) // false

// 是否为严格子集（真子集）
print(setC.isStrictSubset(of: setA)) // true
print(setA.isStrictSubset(of: setA)) // false

// 是否为严格超集
print(setA.isStrictSuperset(of: setC)) // true

// 是否不相交（没有共同元素）
let setE: Set = [5, 6, 7]
print(setA.isDisjoint(with: setE)) // true
print(setA.isDisjoint(with: setC)) // false
```

## 6. 高级操作

### 6.1 过滤和转换

```swift
let numbers: Set = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// 过滤
let evenNumbers = numbers.filter { $0 % 2 == 0 } // 返回数组 [6, 4, 8, 2, 10]
let evenSet = Set(numbers.filter { $0 % 2 == 0 }) // 转换回 Set

// 映射
let squaredNumbers = numbers.map { $0 * $0 } // 返回数组 [100, 25, 49, 64, 4, 9, 36, 81, 16, 1]
let squaredSet = Set(numbers.map { $0 * $0 })

// 压缩映射
let validNumbers = numbers.compactMap { $0 > 5 ? $0 : nil } // [10, 7, 8, 6, 9]

// 归约
let sum = numbers.reduce(0, +)
let product = numbers.reduce(1, *)
```

### 6.2 条件操作

```swift
let fruits: Set = ["Apple", "Banana", "Cherry", "Date"]

// 检查是否所有元素都满足条件
let allLong = fruits.allSatisfy { $0.count > 3 } // true

// 检查是否存在满足条件的元素
let hasShort = fruits.contains { $0.count <= 4 } // true

// 查找第一个满足条件的元素
let firstLong = fruits.first { $0.count > 5 } // "Banana" 或 "Cherry"
```

## 7. 性能特点

### 7.1 时间复杂度

| 操作 | 平均时间复杂度 | 最坏时间复杂度 |
|------|----------------|----------------|
| 插入 | O(1) | O(n) |
| 删除 | O(1) | O(n) |
| 查找 | O(1) | O(n) |
| 包含检查 | O(1) | O(n) |

### 7.2 性能对比示例

```swift
// Set vs Array 查找性能对比
let largeArray = Array(1...100000)
let largeSet = Set(largeArray)

// Array 查找：O(n)
let arrayStartTime = CFAbsoluteTimeGetCurrent()
let arrayContains = largeArray.contains(99999)
let arrayTime = CFAbsoluteTimeGetCurrent() - arrayStartTime

// Set 查找：O(1)
let setStartTime = CFAbsoluteTimeGetCurrent()
let setContains = largeSet.contains(99999)
let setTime = CFAbsoluteTimeGetCurrent() - setStartTime

print("Array time: \(arrayTime), Set time: \(setTime)")
```

## 8. 实际应用场景

### 8.1 去重操作

```swift
func removeDuplicates<T: Hashable>(from array: [T]) -> [T] {
    return Array(Set(array))
}

let numbersWithDuplicates = [1, 2, 2, 3, 3, 3, 4, 5, 5]
let uniqueNumbers = removeDuplicates(from: numbersWithDuplicates)
print(uniqueNumbers) // [1, 2, 3, 4, 5] (顺序可能不同)
```

### 8.2 权限管理

```swift
struct User {
    let id: String
    var permissions: Set<String>
    
    func hasPermission(_ permission: String) -> Bool {
        return permissions.contains(permission)
    }
    
    mutating func grantPermission(_ permission: String) {
        permissions.insert(permission)
    }
    
    mutating func revokePermission(_ permission: String) {
        permissions.remove(permission)
    }
}

var admin = User(id: "admin", permissions: ["read", "write", "delete"])
admin.grantPermission("admin")
print(admin.hasPermission("write")) // true
```

### 8.3 标签系统

```swift
struct Article {
    let title: String
    var tags: Set<String>
    
    func hasTag(_ tag: String) -> Bool {
        return tags.contains(tag)
    }
    
    func hasAnyTag(from tagSet: Set<String>) -> Bool {
        return !tags.isDisjoint(with: tagSet)
    }
    
    func hasAllTags(from tagSet: Set<String>) -> Bool {
        return tagSet.isSubset(of: tags)
    }
}

let article = Article(title: "Swift Tutorial", tags: ["iOS", "Swift", "Programming"])
let searchTags: Set<String> = ["Swift", "Tutorial"]
print(article.hasAnyTag(from: searchTags)) // true
```

### 8.4 图算法中的应用

```swift
class Graph {
    private var adjacencyList: [String: Set<String>] = [:]
    
    func addVertex(_ vertex: String) {
        adjacencyList[vertex] = Set<String>()
    }
    
    func addEdge(from source: String, to destination: String) {
        adjacencyList[source]?.insert(destination)
        adjacencyList[destination]?.insert(source)
    }
    
    func neighbors(of vertex: String) -> Set<String> {
        return adjacencyList[vertex] ?? Set<String>()
    }
    
    func hasEdge(from source: String, to destination: String) -> Bool {
        return adjacencyList[source]?.contains(destination) ?? false
    }
}
```

## 9. 注意事项和最佳实践

### 9.1 Hashable 要求

```swift
// 自定义类型需要实现 Hashable 协议
struct Person: Hashable {
    let name: String
    let age: Int
    
    // Hashable 继承自 Equatable
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
    
    // 可以自定义 hash 函数，但通常不需要
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(age)
    }
}

let people: Set<Person> = [
    Person(name: "Alice", age: 30),
    Person(name: "Bob", age: 25)
]
```

### 9.2 性能优化建议

```swift
// 预分配容量
var largeSet = Set<Int>()
largeSet.reserveCapacity(10000)

// 批量操作优于逐个操作
let newElements = [1, 2, 3, 4, 5]
largeSet.formUnion(newElements) // 优于逐个 insert
```

### 9.3 线程安全

```swift
// Set 不是线程安全的，并发访问时需要同步
import Foundation

class ThreadSafeSet<T: Hashable> {
    private var set = Set<T>()
    private let queue = DispatchQueue(label: "thread-safe-set", attributes: .concurrent)
    
    func insert(_ element: T) {
        queue.async(flags: .barrier) {
            self.set.insert(element)
        }
    }
    
    func contains(_ element: T) -> Bool {
        return queue.sync {
            return set.contains(element)
        }
    }
}
```

## 10. 总结

Set 是 Swift 中强大的集合类型，特别适用于：
- 需要保证元素唯一性的场景
- 频繁的查找、插入、删除操作
- 集合运算（交集、并集、差集等）
- 去重操作
- 标签和权限管理系统

掌握 Set 的各种操作和应用场景，能够帮助我们编写更高效、更清晰的 Swift 代码。
