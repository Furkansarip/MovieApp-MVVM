//
//  MovieCell.swift
//  MovieApp
//
//  Created by Furkan Sarı on 22.01.2023.
//

import UIKit

final class MovieCell: UICollectionViewCell {
    
    static let reuseID = "MovieCell"
    private var posterPathImage : PosterImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configurePosterPath()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 16
        clipsToBounds = true
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterPathImage.image = nil
        posterPathImage.cancelDownloading()
    }
    
    func setCell(movie : MovieResults) {
        posterPathImage.downloadImages(movie: movie)
    }
    
    private func configurePosterPath() {
        posterPathImage = PosterImageView(frame: .zero)
        addSubview(posterPathImage)
        posterPathImage.pinToEdges(view: self)
        backgroundColor = .systemPink
    }
}
