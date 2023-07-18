import Foundation

func fibonacciArray(_ num: Int, _ count: Int) -> [Int] {
    
    // Use var because we will append more elements to it
    var fibonacci = [0, 1]
    
    
    while fibonacci.last! < num + count * count {
        
        let nextNum = fibonacci[fibonacci.count - 1] + fibonacci[fibonacci.count - 2]
        fibonacci.append(nextNum)
    }
    
    
    guard let startIndex = fibonacci.firstIndex(of: num) else {
        return []
    }
    
    
    return Array(fibonacci[startIndex..<startIndex+count])
}


// Test examples

let result1 = fibonacciArray(3, 2)
print(result1)

let result2 = fibonacciArray(5, 3)
print(result2)

let result3 = fibonacciArray(4, 4)
print(result3)

let result4 = fibonacciArray(8, 3)
print(result4)

