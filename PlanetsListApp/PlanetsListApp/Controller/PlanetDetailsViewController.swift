//
//  PlanetDetailsViewController.swift
//  PlanetsListApp
//
//  Created by Abhinav Mandloi on 30/07/21.
//

import UIKit


class PlanetDetailsViewController: UIViewController {
    
    @IBOutlet weak var view_Background: UIView!
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_rotation_period: UILabel!
    @IBOutlet weak var lbl_orbital_period: UILabel!
    @IBOutlet weak var lbl_diameter: UILabel!
    @IBOutlet weak var lbl_climate: UILabel!
    @IBOutlet weak var lbl_gravity: UILabel!
    @IBOutlet weak var lbl_terrain: UILabel!
    @IBOutlet weak var lbl_surface_water: UILabel!
    @IBOutlet weak var lbl_population: UILabel!
    
    var planet: Planet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setPlanetDetailData()
    }
    
    //Set Data for UI
    private func setPlanetDetailData() {
        
        if let _planet = self.planet {
            self.title = _planet.name.capitalized
            self.lbl_name.text = PlanetDetailsConstants.name + "\(_planet.name)"
            self.lbl_rotation_period.text = PlanetDetailsConstants.rotation_period + "\(_planet.rotation_period.capitalized)"
            self.lbl_orbital_period.text = PlanetDetailsConstants.orbital_period + "\(_planet.orbital_period.capitalized)"
            self.lbl_diameter.text = PlanetDetailsConstants.diameter + "\(_planet.diameter.capitalized)"
            self.lbl_climate.text = PlanetDetailsConstants.climate + "\(_planet.climate.capitalized)"
            self.lbl_gravity.text = PlanetDetailsConstants.gravity + "\(_planet.gravity.capitalized)"
            self.lbl_terrain.text = PlanetDetailsConstants.terrain + "\(_planet.terrain.capitalized)"
            self.lbl_surface_water.text = PlanetDetailsConstants.surface_water + "\(_planet.surface_water.capitalized)"
            self.lbl_population.text = PlanetDetailsConstants.population + "\(_planet.population.capitalized)"
        }
    }
    
}

