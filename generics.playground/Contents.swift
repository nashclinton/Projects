import Foundation


//func reverseIntArray (_ array: [Int]) -> [Int] {
//    var reversedArray: [Int] = []
//    for element in array.reversed() {
//        reversedArray.append(element)
//    }
//    return reversedArray
//}

func reverseIntArray<T> (_ array: [T]) -> [T] {
    var reversedArray: [T] = []
    for element in array.reversed() {
        reversedArray.append(element)
    }
    return reversedArray
}
let intArray = [1, 2, 3, 4, 5]
let reversedIntArray = reverseIntArray(intArray)
print(reversedIntArray)

let strings = ["Hello", "World", "Swift"]
let reversedStrings = reverseIntArray(strings)

func findMaximum<T: Comparable>(in array: [T]) -> T? {
    return array.max()
}

let maximumInt = findMaximum(in: intArray)

let maximumString = findMaximum(in: strings)

struct Stack<T> {
    var items: [T] = []
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T? {
        items.popLast()
    }
}

var myStack = Stack<Int>()
myStack.push(1)
myStack.push(2)
myStack.push(3)
myStack.push(4)
myStack.push(5)
print(myStack.pop())
