//
//  PlanetNameTableViewCell.swift
//  PlanetsListApp
//
//  Created by Abhinav Mandloi on 30/07/21.
//

import UIKit

class PlanetNameTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var lbl_planetName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.cellBackgroundView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
