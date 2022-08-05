//
//  Functions.swift
//  genericNeoProject
//
//  Created by Neosoft on 03/02/22.
//

import Foundation
import UIKit

extension URLSession {
    enum CustomError: Error{
        case invalidData
    }
    
    func request<T:Codable>(url:URL?,expecting: T.Type,completion:@escaping(Result<T,Error>) -> Void){
        guard let url = url else{
            completion(.failure(CustomError.invalidData))
            return
        }
        let task = dataTask(with: url) { data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }else{
                    completion(.failure(CustomError.invalidData))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
                
            }catch{
                completion(.failure(error))
            }

        }
        task.resume()
    }
}



