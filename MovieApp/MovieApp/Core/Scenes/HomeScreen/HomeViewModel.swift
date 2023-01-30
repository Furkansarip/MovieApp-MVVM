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
    func getDetail(id:Int)
    var view : HomeScreenProtocol? { get set }
}

final class HomeViewModel {
   weak var view: HomeScreenProtocol?
    private var service = MovieService()
    var movies = [MovieResults]()
    private var page : Int = 1
}

extension HomeViewModel : HomeViewModelProtocol {
   
 
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    
    func getMovies() {
        service.getMovies(page: page) { [weak self] returnedMovies in
            guard let self = self else { return }
            guard let returnedMovies = returnedMovies else { return }
            self.movies.append(contentsOf: returnedMovies)
            self.page += 1
            self.view?.reloadCollectionView()
        }
        
    }
    
    func getDetail(id: Int) {
        service.movieDetail(id: id) { [weak self] returnedDetail in
            guard let self = self else { return }
            guard let returnedDetail = returnedDetail else { return }
            self.view?.navigateToDetailScreen(movie: returnedDetail)
           
        }
    }
    
}
