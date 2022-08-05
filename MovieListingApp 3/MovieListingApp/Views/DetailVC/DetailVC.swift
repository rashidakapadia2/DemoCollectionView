//
//  DetailVC.swift
//  MovieListingApp
//
//  Created by Neosoft on 05/08/22.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var moviePosterImgView: UIImageView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieYearLbl: UILabel!
    @IBOutlet weak var moviePlotLbl: UILabel!
    @IBOutlet weak var movieCastLbl: UILabel!
    @IBOutlet weak var imdbRatingLbl: UILabel!
    
    let fetch = Fetch()
    
    var movieId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetch.fetchDetail(id: movieId) { detailData in
            DispatchQueue.main.async {
                self.moviePosterImgView.downloaded(from: detailData.poster, contentMode: .scaleToFill)
                self.movieTitleLbl.text = detailData.title
                self.movieYearLbl.text = detailData.year
                self.moviePlotLbl.text = detailData.plot
                self.movieCastLbl.text = detailData.actors
                self.imdbRatingLbl.text = detailData.imdbRating
            }
        }
    }

}

//extension NSLayoutConstraint {
//    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
//        return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
//    }
//}
