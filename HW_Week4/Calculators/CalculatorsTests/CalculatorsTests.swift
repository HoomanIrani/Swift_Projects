import XCTest
@testable import Calculators

final class CalculatorsTests: XCTestCase {
    
    var calculator: Calculator!
    
    override func setUpWithError() throws {
        calculator = Calculator()
    }
    
    override func tearDown() {
        calculator = nil
    }
    
    func test_addNumbers_shouldAdd() {
        
        // reset the value at func level
        let cal = Calculator()
        
        let result = calculator.addNumbers(3, 4)
        XCTAssertEqual(result, 7)
    }
    
    func test_addNumbers_shouldFail() {
        
        // reset the value at func level
        let cal = Calculator()
        
        let result = calculator.addNumbers(5, 6)
        XCTAssertNotNil(calculator)
    }

}
