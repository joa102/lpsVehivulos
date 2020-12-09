//
//  ExperimentoTableViewCell.swift
//  dVehiculos
//
//  Created by Juandi on 02/12/2020.
//  Copyright © 2020 Juandi. All rights reserved.
//

import UIKit

class ExperimentoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageExperimento: UIImageView!
    @IBOutlet weak var labelExperimento: UILabel!
    @IBOutlet weak var labelNombre: UILabel!
    @IBOutlet weak var labelFecha: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

