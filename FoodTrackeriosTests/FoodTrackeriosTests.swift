

import XCTest
@testable import FoodTrackerios

class FoodTrackeriosTests: XCTestCase {
    
    //MARK: Foodtracker tests
    
    //Tests to confirm that the Meal Initialzer returnswhen no name or negative rating provided.
    
    func testMealInitialization(){
        
        //Success  case
        
        let potentialItem = Meal(name: "Newest Item added", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        //Failure case
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid, Be positive")
        
    }
    
    
}
