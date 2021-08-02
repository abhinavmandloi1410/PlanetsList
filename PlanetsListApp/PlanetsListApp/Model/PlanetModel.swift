//
//  PlanetModel.swift
//  PlanetsListApp
//
//  Created by Abhinav Mandloi on 30/07/21.
//

import Foundation

struct PlanetRes: Decodable {
    let planets: [Planet]
    
    enum CodingKeys: String, CodingKey {
    case planets = "results"
    }
    
    
}

struct Planet: Decodable {
    let name,
        rotation_period,
        orbital_period,
        diameter,
        climate,
        gravity,
        terrain,
        surface_water,
        population: String
        
}

