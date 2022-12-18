//
//  EquationTableViewCell.swift
//  Calc
//
//  Created by Qeti Avanashvili on 18.12.22.
//

import UIKit

class EquationTableViewCell: UITableViewCell {
    
    @IBOutlet var lhslabel: UILabel!
    @IBOutlet var rhslabel: UILabel!
    @IBOutlet var resultlabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
