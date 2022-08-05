//
//  ViewModel.swift
//  MovieListingApp
//
//  Created by Neosoft on 03/08/22.
//

import Foundation

class Fetch{
    func fetch(completed: @escaping ([Search]) -> ()){
        URLSession.shared.request(url: Urls.url, expecting: MovieModel.self) { result in
            switch result{
            case .success(let user):
                completed(user.search)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchDetail(id:String,completed: @escaping (MovieDetail) -> ()){
        let url = Urls.detailBaseUrl+id
        URLSession.shared.request(url: URL(string: url), expecting: MovieDetail.self) { result in
            switch result{
            case .success(let user):
                completed(user)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchExtra(pageNo:Int,completed: @escaping ([Search]) -> ()){
        let pgNo = String(pageNo)
        let url = Urls.listUrl+pgNo
        URLSession.shared.request(url: URL(string: url), expecting: MovieModel.self) { result in
            switch result{
            case .success(let user):
                completed(user.search)
            case .failure(let error):
                print(error)
            }
        }
    }
}
