//
//  PlanetService.swift
//  PlanetsListApp
//
//  Created by Abhinav Mandloi on 30/07/21.
//

import Foundation

struct URLConstants {
    static var PLANET_URL = "https://swapi.dev/api/planets/"
}

struct PlanetResource {
    
    func getPlanet(completionHandler: @escaping (PlanetRes?) -> ()) {
        
        let planetURL = URL(string: URLConstants.PLANET_URL)!
        
        URLSession.shared.dataTask(with: planetURL) { (data, response, error) in
            
            if(error == nil && data != nil)
            {
                do
                {
                    let planetResponse = try JSONDecoder().decode(PlanetRes.self, from: data!)
                    
                    completionHandler(planetResponse)
                }
                catch let error {
                    print(error)
                }
            }
            
        }.resume()
        
    }
    
}
