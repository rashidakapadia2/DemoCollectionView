//
//  ViewController.swift
//  MovieListingApp
//
//  Created by Neosoft on 03/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var movieData = [Search]()
    let fetch = Fetch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        fetch.fetch { movies in
            self.movieData = movies
            print(self.movieData)
            DispatchQueue.main.async {
                self.movieCollectionView.reloadData()
            }
        }
    }
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath)as! MovieCell
        mCell.movieYearLbl.text = movieData[indexPath.row].year
        mCell.movieTitleLbl.text = movieData[indexPath.row].title
        mCell.moviePosterImgView.downloaded(from: movieData[indexPath.row].poster)
        return mCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let modelId = movieData[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let dvc = sb.instantiateViewController(withIdentifier: "DetailVC")as! DetailVC
        dvc.movieId = modelId.imdbID
        //dvc.movieID = modelId.imdbID
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        if UIDevice.current.orientation == .portrait{
            return CGSize(width: collectionViewWidth/3 - 5, height: 320)
        }
        else if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight{
            return CGSize(width: collectionViewWidth/5 - 3, height: 300)
        }
        else{
            return CGSize(width: 0, height: 0)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.row == movieData.count-1{
//            for i in 2...10{
//                if i==5{
//                    break
//                }else{
//                    fetch.fetchExtra(pageNo: i) { extraData in
//                        self.movieData.append(contentsOf: extraData)
//                    }
//                }
//                DispatchQueue.main.async {
//                    self.movieCollectionView.reloadData()
//                }
//            }
//            DispatchQueue.main.async {
//                self.movieCollectionView.reloadData()
//            }
//            for i in 2...5{
//                fetch.fetchExtra(pageNo: i) { extraData in
//                    self.movieData = self.movieData+extraData
//                    print(self.movieData)
//                }
//            }
//        }
    }
    
//    func loadNew(pgNo:Int){
//        fetch.fetchExtra(pageNo: pgNo) { extraMovie in
//
//        }
//    }
    
}
