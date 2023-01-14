//
//  MovieModel.swift
//  MovieApp
//
//  Created by Furkan Sarı on 14.01.2023.
//

import Foundation

struct MovieModel : Decodable {
    let results : [MovieResults]?
}

struct MovieResults : Decodable {
    let id : Int?
    let posterPath:String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
}
