import Foundation

@discardableResult
func fibonacci(_ num: Int) -> Int{
    
    if(num == 0){
        return 0;
    }
    else if(num == 1){
        return 1;
    }
    else {
        return fibonacci(num - 2) + fibonacci(num - 1)
    }
}

let result = fibonacci(10)
print(result)
