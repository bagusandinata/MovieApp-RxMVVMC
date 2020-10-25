//
//  MoviesRepository.swift
//  MovieApp-RxMVVMC
//
//  Created by Bagus Andinata on 25/10/20.
//

import Foundation

protocol MoviesRepository {
    func fetchMoviesList(query: MovieQuery, page: Int,
                         cached: @escaping (MoviesPage) -> Void,
                         completion: @escaping (Result<MoviesPage, Error>) -> Void)
}
