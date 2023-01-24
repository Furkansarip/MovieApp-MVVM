//
//  PosterImageView.swift
//  MovieApp
//
//  Created by Furkan Sarı on 23.01.2023.
//

import UIKit

final class PosterImageView: UIImageView {

    private var dataTask : URLSessionDataTask?
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImages(movie : MovieResults) {
       guard let url = URL(string: APIURLs.imageURL(posterPath: movie._posterPath)) else { return }
        
        dataTask = NetworkManager.shared.download(url: url, completion: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            case .failure(_):
                break
            }
        })
        dataTask?.resume()
        
    }
    
    func cancelDownloading() {
        dataTask?.cancel()
        dataTask = nil
    }
    

}
