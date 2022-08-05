//
//  MovieListCell.swift
//  MovieListingApp
//
//  Created by Neosoft on 03/08/22.
//

import UIKit

class MovieListCell: UITableViewCell {

    @IBOutlet weak var moviePosterImgView: UIImageView!
    @IBOutlet weak var movieNameLbl: UILabel!
    @IBOutlet weak var movieYearLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
