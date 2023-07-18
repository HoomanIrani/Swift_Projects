import Foundation

class Calculator {
    
    func addNumbers(_ num1: Int, _ num2: Int) -> Int {
        return num1 + num2
    }
    
    func subtractNumbers(_ num1: Int, _ num2: Int) -> Int {
        return num1 - num2
    }
    
    func multiplyNumbers(_ num1: Int, _ num2: Int) -> Int {
        return num1 * num2
    }
    
    func divideNumbers (_ num1: Int, _ num2: Int) -> Double? {
        guard num2 != 0 else {
            return nil
        }
        return Double(num1) / Double(num2)
    }
    
    func isPrime(_ number: Int) -> Bool {
        if(number <= 1){
            return false
        }
        
        for i in 2..<number {
            if(number % i == 0){
                return false
            }
        }
        return true
    }
}

