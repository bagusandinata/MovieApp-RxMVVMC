//
//  MoviesRequestDTO.swift
//  MovieApp-RxMVVMC
//
//  Created by Bagus Andinata on 24/10/20.
//

import Foundation

struct MoviesRequestDTO: Encodable {
    let query: String
    let page: Int
}
