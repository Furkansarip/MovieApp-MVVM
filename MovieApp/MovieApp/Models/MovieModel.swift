//
//  MovieModel.swift
//  MovieApp
//
//  Created by Furkan Sarı on 14.01.2023.
//

import Foundation

struct MovieModel {
    let results : [MovieResults]?
}

struct MovieResults {
    let id : Int?
    let posterPath:String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
}
