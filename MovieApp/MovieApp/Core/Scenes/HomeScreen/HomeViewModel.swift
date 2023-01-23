//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Furkan Sarı on 22.01.2023.
//

import Foundation

protocol HomeViewModelProtocol {
    func viewDidLoad()
    var view : HomeScreenProtocol? { get set }
}

final class HomeViewModel {
   weak var view: HomeScreenProtocol?
}

extension HomeViewModel : HomeViewModelProtocol {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
    }
    
    
}
