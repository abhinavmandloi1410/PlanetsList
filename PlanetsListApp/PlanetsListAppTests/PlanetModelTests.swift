//
//  PlanetModelTests.swift
//  PlanetsListAppTests
//
//  Created by Abhinav Mandloi on 02/08/21.
//

import XCTest
@testable import PlanetsListApp

class PlanetModelTests: XCTestCase {
    
    func testPlanetModel() {
        
        let expectation = self.expectation(description: "testPlanetModel")
        
        // given
        let planet = Planet(name: "Tatooine",
                            rotation_period: "23",
                            orbital_period: "304",
                            diameter: "10465",
                            climate: "arid",
                            gravity: "1 standard",
                            terrain: "desert",
                            surface_water: "1",
                            population: "200000")
        
        // when
        let planetRes: PlanetRes = PlanetRes(planets: [planet])
        
        // then
        guard let _planet = planetRes.planets.first else {
            XCTFail("planet Request request error")
            expectation.fulfill()
            return
        }
        
        XCTAssertEqual(_planet.name, "Tatooine")
        XCTAssertEqual(_planet.climate, "arid")
        XCTAssertEqual(_planet.surface_water, "1")
        XCTAssertEqual(_planet.rotation_period, "23")
        XCTAssertEqual(_planet.population, "200000")
        XCTAssertEqual(_planet.orbital_period, "304")
        XCTAssertEqual(_planet.gravity, "1 standard")
        XCTAssertEqual(_planet.diameter, "10465")
        XCTAssertEqual(_planet.terrain, "desert")
        
        expectation.fulfill()
        
        wait(for: [expectation], timeout: 10.0)
    }
}
