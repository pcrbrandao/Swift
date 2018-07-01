//: [Previous](@previous)

import Foundation

let array = [1, 2, 3, 4, 5]
let seekNum = 2
let mapResult = array.map({ (i:Int) -> Int in
    if i == seekNum {
        return i
    }
    return 0
})
print(mapResult)

let filterResult = array.filter { $0 == seekNum }
print(filterResult)

let reduceResult = array.reduce(0, +)
print(reduceResult)

let wordsArray = ["one","two","three"]
let reduceWordsResult = wordsArray.reduce("") { (result, string) -> String in
    let out = result.count > 0 ? "\(result), \(string)" : string
    return out
}
print(reduceWordsResult)

let maxReduce = array.reduce(0) { (result, number) -> Int in
    if result > number {
        return result
    }
    return number
}
print(maxReduce)
