//
//  MovieCell.swift
//  MovieListingApp
//
//  Created by Neosoft on 03/08/22.
//

import UIKit

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var moviePosterImgView: UIImageView!
    @IBOutlet weak var movieYearLbl: UILabel!
    @IBOutlet weak var movieTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
