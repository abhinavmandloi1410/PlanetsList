//
//  PlanetListViewController.swift
//  PlanetsListApp
//
//  Created by Abhinav Mandloi on 26/07/21.
//

import UIKit

class PlanetListViewController: UIViewController {
    
    // MARK:- Constants
    private static let CELL_IDENTIFIER = "cell"
    private static let VIEWCONTROLLER_IDENTIFIER = "PlanetDetailsViewController"
    private static let CELL_HEIGHT = 100.0
    
    @IBOutlet weak var planetListTableView: UITableView!
    private var planets: [Planet]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.apiCall()
    }
    
    //API Call to fetch the Planet Data
    private func apiCall() {
        
        let planetResource: PlanetResource = PlanetResource()
        
        planetResource.getPlanet(){ (_planetResponse) in
            
            if(_planetResponse?.planets != nil)
            {
                self.planets = _planetResponse?.planets
                
                DispatchQueue.main.async {
                    self.planetListTableView.reloadData()
                }
            }
        }
    }
}

//Extension to use UITableViewDataSource Methods
extension PlanetListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.planets?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let planetNameCell = tableView.dequeueReusableCell(withIdentifier: PlanetListViewController.CELL_IDENTIFIER) as! PlanetNameTableViewCell
        planetNameCell.selectionStyle = .none
        if let planetTitle = self.planets?[indexPath.row].name {
            planetNameCell.lbl_planetName.text = planetTitle
        }
        return planetNameCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(PlanetListViewController.CELL_HEIGHT)
    }
    
}

//Extension to use UITableViewDelegate Methods
extension PlanetListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let planetDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: PlanetListViewController.VIEWCONTROLLER_IDENTIFIER) as! PlanetDetailsViewController
        if let _planet = self.planets?[indexPath.row] {
            planetDetailsViewController.planet = _planet
        }
        let navigationVC = UINavigationController(rootViewController: planetDetailsViewController)
        
        self.present(navigationVC, animated: true, completion: nil)
        
    }
}

