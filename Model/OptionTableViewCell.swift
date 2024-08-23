//
//  OptionTableViewCell.swift
//  Project111
//
//  Created by 洪宗燦 on 2024/8/18.
//
import UIKit

class OptionTableViewCell: UITableViewCell {

  
    
    @IBOutlet weak var namesLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
