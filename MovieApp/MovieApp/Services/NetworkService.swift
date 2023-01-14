//
//  NetworkService.swift
//  MovieApp
//
//  Created by Furkan Sarı on 14.01.2023.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    func download(url:URL, completion:@escaping(_ result:Result<Data,Error>)->()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badURL)))
                return
            }
            
        }
    }
}
