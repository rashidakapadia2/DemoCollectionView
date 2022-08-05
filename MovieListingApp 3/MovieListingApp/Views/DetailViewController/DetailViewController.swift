//
//  DetailViewController.swift
//  MovieListingApp
//
//  Created by Neosoft on 04/08/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var moviePosterImgView: UIImageView!
    @IBOutlet weak var movieLblTitle: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var plotLbl: UILabel!
    @IBOutlet weak var actorsLbl: UILabel!
    
    
    let fetch = Fetch()
    
    var movieID = ""
    
    var movieTitle = ""
    var movieYear = ""
    var moviePlot = ""
    var movieActors = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch.fetchDetail(id: movieID) { movieDetail in
            DispatchQueue.main.async {
                self.movieLblTitle.text = movieDetail.title
                self.actorsLbl.text = movieDetail.actors
                self.yearLbl.text = movieDetail.year
                self.plotLbl.text = movieDetail.plot
                self.moviePosterImgView.downloaded(from: movieDetail.poster, contentMode: .scaleToFill)
            }
            
        }
    }
}
