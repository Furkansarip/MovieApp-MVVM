//
//  NetworkServçe.swift
//  MovieApp
//
//  Created by Furkan Sarı on 15.01.2023.
//

import Foundation

class MovieService {
    func getMovies(page:Int,completion:@escaping ([MovieResults]?)->()) {
        guard let url = URL(string: APIURLs.popularMovies(page: 1)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
            completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    private func handleWithError(_ error:Error)  {
        print(error.localizedDescription)
    }
    
    private func handleWithData(_ data:Data) -> [MovieResults]? {
        do {
            let movies = try JSONDecoder().decode(MovieModel.self, from: data)
            return movies.results
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
