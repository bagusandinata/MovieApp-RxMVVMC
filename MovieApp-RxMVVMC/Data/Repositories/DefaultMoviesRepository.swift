//
//  DefaultMoviesRepository.swift
//  MovieApp-RxMVVMC
//
//  Created by Bagus Andinata on 25/10/20.
//

import Foundation
import RxSwift

final class DefaultMoviesRepository {

    private let cache: MoviesResponseStorage
    private let disposeBag = DisposeBag()

    init(cache: MoviesResponseStorage) {
        self.cache = cache
    }
}

extension DefaultMoviesRepository: MoviesRepository {

    func fetchMoviesList(query: MovieQuery, page: Int, cached: @escaping (MoviesPage) -> Void, completion: @escaping (Result<MoviesPage, Error>) -> Void) {
        
        let requestDTO = MoviesRequestDTO(query: query.query, page: page)
        
        cache.getResponse(for: requestDTO) { (result) in
            if case let .success(responseDTO?) = result {
                cached(responseDTO.toDomain())
            }
        }
    }
}
