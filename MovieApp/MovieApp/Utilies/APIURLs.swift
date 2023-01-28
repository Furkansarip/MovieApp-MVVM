//
//  APIURLs.swift
//  MovieApp
//
//  Created by Furkan Sarı on 21.01.2023.
//

import Foundation
//dc2a281262a1d9b4c401e752970f28cd
enum APIURLs {
    static func popularMovies(page:Int) -> String {
   return "https://api.themoviedb.org/3/movie/popular?api_key=dc2a281262a1d9b4c401e752970f28cd&language=en-US&page=\(page)"
        
    }
    
    static func imageURL(posterPath:String) -> String {
        "https://image.tmdb.org/t/p/w500/\(posterPath)"
    }
    
    static func getDetail(id : Int) -> String {
        "https://api.themoviedb.org/3/movie/\(id)?api_key=dc2a281262a1d9b4c401e752970f28cd&language=en-US"
    }
}
