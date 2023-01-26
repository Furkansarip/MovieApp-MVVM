//
//  UICollectionView+Ext.swift
//  MovieApp
//
//  Created by Furkan Sarı on 27.01.2023.
//

import UIKit

extension UICollectionView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
      
    }
}
