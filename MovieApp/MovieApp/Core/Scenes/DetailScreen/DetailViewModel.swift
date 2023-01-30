//
//  DetailViewModel.swift
//  MovieApp
//
//  Created by Furkan Sarı on 30.01.2023.
//

import Foundation

protocol DetailViewProtocol {
    var delegate : DetailScreenProtocol? { get set }
    func viewDidLoad()
    
}

final class DetailViewModel {
    weak var delegate: DetailScreenProtocol?
}

extension DetailViewModel : DetailViewProtocol {
    
    func viewDidLoad() {
        delegate?.configureVC()
        delegate?.configurePosterImage()
        delegate?.downloadImage()
        delegate?.configureTitle()
        delegate?.configureDate()
        delegate?.configureOverview()
    }
    
    
    
    
    
}
