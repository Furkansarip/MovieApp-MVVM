//
//  UIView+Ext.swift
//  MovieApp
//
//  Created by Furkan Sarı on 22.01.2023.
//

import UIKit

extension UIView {
    func pinToEdges(view:UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
        
    }
}
