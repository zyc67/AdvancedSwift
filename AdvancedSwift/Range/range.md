# Swift Range 详细解释与用法

## 目录
- [Range概述](#range概述)
- [Range类型](#range类型)
- [基本用法](#基本用法)
- [常用操作](#常用操作)
- [实际应用场景](#实际应用场景)
- [性能注意事项](#性能注意事项)

## Range概述

Range在Swift中是一个强大的工具，用于表示一系列连续的值。它广泛应用于数组切片、循环遍历、模式匹配等场景。

## Range类型

Swift提供了几种不同的Range类型：

### 1. 闭区间范围 (ClosedRange)
使用 `...` 操作符，包含起始值和结束值。

```swift
let closedRange = 1...5  // 包含 1, 2, 3, 4, 5
let letters = "a"..."z"  // 包含 a 到 z 的所有字母
```

### 2. 半开区间范围 (Range)
使用 `..<` 操作符，包含起始值但不包含结束值。

```swift
let halfOpenRange = 1..<5  // 包含 1, 2, 3, 4（不包含5）
let arrayIndices = 0..<array.count  // 数组的有效索引范围
```

### 3. 单侧范围 (PartialRangeFrom/PartialRangeUpTo/PartialRangeThrough)

#### PartialRangeFrom - 从某值开始到最后
```swift
let fromRange = 2...  // 从2开始到最后
let suffix = array[2...]  // 获取数组从索引2开始的所有元素
```

#### PartialRangeUpTo - 从开始到某值（不包含）
```swift
let upToRange = ..<5  // 从开始到5（不包含5）
let prefix = array[..<3]  // 获取数组前3个元素
```

#### PartialRangeThrough - 从开始到某值（包含）
```swift
let throughRange = ...5  // 从开始到5（包含5）
let prefix = array[...2]  // 获取数组前3个元素（索引0,1,2）
```

## 基本用法

### 1. 数组切片
```swift
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// 获取子数组
let slice1 = numbers[2...5]      // [3, 4, 5, 6]
let slice2 = numbers[2..<5]      // [3, 4, 5]
let slice3 = numbers[2...]       // [3, 4, 5, 6, 7, 8, 9, 10]
let slice4 = numbers[...3]       // [1, 2, 3, 4]
let slice5 = numbers[..<3]       // [1, 2, 3]
```

### 2. 字符串切片
```swift
let str = "Hello, World!"
let startIndex = str.startIndex
let endIndex = str.endIndex

// 获取子字符串
let range1 = str[startIndex..<str.index(startIndex, offsetBy: 5)]  // "Hello"
let range2 = str[str.index(endIndex, offsetBy: -6)..<endIndex]     // "World!"
```

### 3. 循环遍历
```swift
// 使用闭区间
for i in 1...5 {
    print(i)  // 输出 1, 2, 3, 4, 5
}

// 使用半开区间
for i in 0..<array.count {
    print(array[i])
}

// 逆序遍历
for i in (1...5).reversed() {
    print(i)  // 输出 5, 4, 3, 2, 1
}
```

### 4. Switch模式匹配
```swift
let score = 85

switch score {
case 0..<60:
    print("不及格")
case 60..<80:
    print("及格")
case 80..<90:
    print("良好")
case 90...100:
    print("优秀")
default:
    print("无效分数")
}
```

## 常用操作

### 1. 检查范围包含关系
```swift
let range = 1...10

// 检查是否包含某个值
if range.contains(5) {
    print("范围包含5")
}

// 检查是否为空
if range.isEmpty {
    print("范围为空")
}
```

### 2. 范围转换
```swift
let closedRange = 1...5
let array = Array(closedRange)  // [1, 2, 3, 4, 5]

// Range 和 ClosedRange 之间的转换
let range = 1..<6
let closed = 1...5
// 注意：range 和 closed 表示相同的值集合
```

### 3. 范围边界
```swift
let range = 10...20

print(range.lowerBound)  // 10
print(range.upperBound)  // 20 (对于ClosedRange)

let halfOpen = 10..<20
print(halfOpen.upperBound)  // 20 (对于Range，但不包含这个值)
```

### 4. 范围运算
```swift
// 计算范围的长度
let range = 5...15
let count = range.count  // 11

// 获取随机值
let randomValue = Int.random(in: 1...100)
```

## 实际应用场景

### 1. 数组操作
```swift
var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// 替换子数组
numbers[2...4] = [30, 40, 50]  // [1, 2, 30, 40, 50, 6, 7, 8, 9, 10]

// 删除子数组
numbers.removeSubrange(1...3)  // 删除索引1到3的元素

// 插入元素
numbers.insert(contentsOf: [100, 200], at: 2)
```

### 2. 字符串处理
```swift
let text = "Hello, Swift Programming!"

// 查找子字符串
if let range = text.range(of: "Swift") {
    let substring = text[range]  // "Swift"
    
    // 替换子字符串
    let newText = text.replacingCharacters(in: range, with: "Kotlin")
}

// 提取文件扩展名
let filename = "document.pdf"
if let dotIndex = filename.lastIndex(of: ".") {
    let ext = filename[filename.index(after: dotIndex)...]  // "pdf"
}
```

### 3. 数据验证
```swift
func validateAge(_ age: Int) -> Bool {
    let validRange = 0...150
    return validRange.contains(age)
}

func validateGrade(_ grade: Character) -> Bool {
    let validGrades: ClosedRange<Character> = "A"..."F"
    return validGrades.contains(grade)
}
```

### 4. 时间范围处理
```swift
import Foundation

let calendar = Calendar.current
let now = Date()
let startOfDay = calendar.startOfDay(for: now)
let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!

// 检查时间是否在工作时间内
let workStart = calendar.date(bySettingHour: 9, minute: 0, second: 0, of: now)!
let workEnd = calendar.date(bySettingHour: 17, minute: 30, second: 0, of: now)!

if workStart...workEnd ~= now {
    print("现在是工作时间")
}
```

## 性能注意事项

### 1. 切片性能
```swift
let largeArray = Array(1...1000000)

// 高效：切片不会复制数组，只是创建视图
let slice = largeArray[1000...2000]  // O(1)

// 低效：转换为数组会复制数据
let copiedArray = Array(largeArray[1000...2000])  // O(n)
```

### 2. 字符串Range的性能
```swift
let longString = String(repeating: "a", count: 1000000)

// 低效：每次都要计算索引位置
let badSlice = longString[longString.index(longString.startIndex, offsetBy: 1000)...]

// 高效：缓存计算的索引
let cachedIndex = longString.index(longString.startIndex, offsetBy: 1000)
let goodSlice = longString[cachedIndex...]
```

### 3. Range比较
```swift
// 对于大范围，检查包含关系是 O(1)
let hugeRange = 1...1000000
let contains = hugeRange.contains(500000)  // O(1)

// 但是创建数组是 O(n)
let array = Array(hugeRange)  // O(n) - 避免对大范围这样做
```

## 高级用法

### 1. 自定义类型的Range
```swift
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
```

### 2. Range与集合操作结合
```swift
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// 筛选范围内的元素
let filtered = numbers.filter { (1...5).contains($0) }

// 使用范围进行映射
let mapped = (1...5).map { $0 * 2 }  // [2, 4, 6, 8, 10]

// 使用范围进行归约
let sum = (1...10).reduce(0, +)  // 55
```

### 3. 范围的条件判断
```swift
// 使用模式匹配操作符 ~=
let value = 75
let range = 70...80

if range ~= value {
    print("值在范围内")
}

// 在数组中使用
let ranges = [0...10, 20...30, 40...50]
let target = 25

for range in ranges {
    if range ~= target {
        print("找到包含\(target)的范围: \(range)")
        break
    }
}
```

## 总结

Range是Swift中一个非常实用的特性，它提供了：

1. **简洁的语法**：用简单的操作符表示复杂的范围概念
2. **类型安全**：在编译时就能发现范围相关的错误
3. **性能优化**：切片操作通常是O(1)的
4. **广泛适用**：可用于数组、字符串、数值类型等多种场景

正确使用Range可以让代码更加简洁、可读且高效。在处理集合数据时，Range是一个不可或缺的工具。
