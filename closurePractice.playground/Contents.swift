import UIKit

var greeting = "Hello, playground"

func sum( number: [Int]) -> Int {
    return 0
}

sum(number: [1,2,3,4,5])


let sumClosure = { (number: [Int]) -> Int  in
    return 0
}

sumClosure([1,2,3,4,5])

let printClosure = { () -> Void in
    print("Something")
}

let printClosure1 = { (string: String) in
    print(string)
}



func myFunction(_ closure: (Int) -> Void) {
}

myFunction1(Int: 2) { print($0) }

//$0 is
