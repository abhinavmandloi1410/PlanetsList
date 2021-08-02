//
//  PlanetsListAppTests.swift
//  PlanetsListAppTests
//
//  Created by Abhinav Mandloi on 26/07/21.
//

import XCTest
@testable import PlanetsListApp

class PlanetsListAppTests: XCTestCase {
    
    func testPlanetAPI() {
        
        let expectation = self.expectation(description: "testPlanetAPI")
        
        let planetResource: PlanetResource = PlanetResource()
        
        planetResource.getPlanet(){ (_planetResponse) in
            
            if(_planetResponse?.planets != nil)
            {
                guard let _planet = _planetResponse?.planets.first else { return }
                
                XCTAssertNotNil(_planet.name)
                XCTAssertNotNil(_planet.climate)
                XCTAssertNotNil(_planet.surface_water)
                XCTAssertNotNil(_planet.rotation_period)
                XCTAssertNotNil(_planet.population)
                XCTAssertNotNil(_planet.orbital_period)
                XCTAssertNotNil(_planet.gravity)
                XCTAssertNotNil(_planet.diameter)
                
                expectation.fulfill()
            }
            else {
                XCTFail("planet Request request error")
                expectation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Something went wrong, request took too long.")
        }
    }
    
}
