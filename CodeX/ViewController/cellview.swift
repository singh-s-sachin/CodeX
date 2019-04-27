//
//  cellview.swift
//  CodeX
//
//  Created by Developer on 20/04/19.
//  Copyright © 2019 Sachin Kumar Singh. All rights reserved.
//

import UIKit

class cellview: UITableViewCell {

    
    @IBOutlet weak var labelname: UILabel!
    @IBOutlet weak var programnames: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func viewbtnpressed(_ sender: Any) {
        
    }
}
