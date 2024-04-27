//
//  DetailsTableViewCell.swift
//  BlackCoffer
//
//  Created by Gokul Murugan on 20/11/23.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    static let identifier = "myDetailsCell"

    @IBOutlet weak var initialsLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var locationsLable: UILabel!
    
    @IBOutlet weak var distanceLable: UILabel!
    
    @IBOutlet weak var distanceProgressView: UIProgressView!
    
    @IBOutlet weak var purposeLable: UILabel!
    
    @IBOutlet weak var statusLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialsLable.layer.cornerRadius = 20
    }

    

    @IBAction func inviteButton(_ sender: Any) {
        
        
        
    }
    
}
