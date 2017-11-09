//
//  MoviesTableViewCell.swift
//  mdb
//
//  Created by Timar Cristian on 04/11/2017.
//  Copyright © 2017 Timar Cristian. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    @IBOutlet var posterCell: UIImageView!
    
    @IBOutlet var titleCell: UILabel!
    
    
    @IBOutlet var descCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        //
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0;//Choose your custom row height
    }

}
