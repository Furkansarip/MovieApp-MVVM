//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Furkan Sarı on 22.01.2023.
//

import Foundation

protocol HomeViewModelProtocol {
    func viewDidLoad()
    func getMovies()
    var view : HomeScreenProtocol? { get set }
}

final class HomeViewModel {
   weak var view: HomeScreenProtocol?
    private var service = MovieService()
    var movies = [MovieResults]()
}

extension HomeViewModel : HomeViewModelProtocol {
 
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    
    func getMovies() {
        service.getMovies(page: 1) { [weak self] returnedMovies in
            guard let self = self else { return }
            guard let returnedMovies = returnedMovies else { return }
            self.movies = returnedMovies
        
        }
    }
    
}
