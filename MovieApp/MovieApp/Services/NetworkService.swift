//
//  NetworkServçe.swift
//  MovieApp
//
//  Created by Furkan Sarı on 15.01.2023.
//

import Foundation

class NetworkService {
    func getMovies() {
        guard let url = URL(string: "asd") else { return }
        print("f\(url)")
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
