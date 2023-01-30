//
//  DetailViewController.swift
//  MovieApp
//
//  Created by Furkan Sarı on 30.01.2023.
//

import UIKit

protocol DetailScreenProtocol : AnyObject {
    func configureVC()
    func configurePosterImage()
    func downloadImage()
    func configureTitle()
    func configureDate()
    func configureOverview()
}

final class DetailViewController: UIViewController {

    
    private let movie : MovieResults
    private var posterImage : PosterImageView!
    private let viewModel = DetailViewModel()
    private var titleLabel : UILabel!
    private var dateLabel : UILabel!
    private var overview : UILabel!
    init(movie: MovieResults) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.viewDidLoad()
    }
    

}

extension DetailViewController : DetailScreenProtocol {
    
    
    func configurePosterImage() {
        posterImage = PosterImageView(frame: .zero)
        let posterWidth = CGFloat.dWidth * 0.4
        posterImage.clipsToBounds = true
        view.addSubview(posterImage)
        NSLayoutConstraint.activate([
            posterImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            posterImage.widthAnchor.constraint(equalToConstant: posterWidth),
            posterImage.heightAnchor.constraint(equalToConstant: posterWidth * 1.5)
        ])
        posterImage.backgroundColor = .red
        
    }
    
    func configureVC() {
        
        view.backgroundColor = .systemBackground
    }
    
    func downloadImage() {
        posterImage.downloadImages(movie: movie)
    }
    
    func configureTitle() {
        titleLabel = UILabel(frame: .zero)
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = movie.title ?? ""
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 2
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: posterImage.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor,constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16)
        ])
    }
    
    func configureDate() {
        dateLabel = UILabel(frame: .zero)
        view.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = movie.releaseDate ?? ""
        dateLabel.font = .systemFont(ofSize: 18)
        dateLabel.textColor = .secondaryLabel
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor,constant: 56),
            dateLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor,constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16)
        ])
    }
    
    func configureOverview() {
        overview = UILabel(frame: .zero)
        overview.translatesAutoresizingMaskIntoConstraints = false
        overview.font = .systemFont(ofSize: 20)
        overview.numberOfLines = 0
        overview.text = movie.overview
        view.addSubview(overview)
        
        NSLayoutConstraint.activate([
            overview.topAnchor.constraint(equalTo: posterImage.bottomAnchor,constant: 16),
            overview.leadingAnchor.constraint(equalTo: posterImage.leadingAnchor),
            overview.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16)
        ])
    }
    
    
    
    
}
