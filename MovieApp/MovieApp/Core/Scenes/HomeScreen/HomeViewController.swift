//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Furkan Sarı on 14.01.2023.
//

import UIKit

protocol HomeScreenProtocol : AnyObject {
    func configureVC()
    func configureCollectionView()
}

final class HomeViewController: UIViewController {
    private let viewModel = HomeViewModel()
    private var collectionView : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()

       
    }

}

extension HomeViewController : HomeScreenProtocol {
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
        collectionView.pinToEdges(view: view)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
}

extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as? MovieCell else { return UICollectionViewCell() }
        return cell
    }
    
    
}
