//
//  GetService.swift
//  MovieApp-RxMVVMC
//
//  Created by Bagus Andinata on 24/10/20.
//

import Foundation
import Moya

let getProvider: MoyaProvider<GetService> = {
    return MoyaProvider<GetService>()
}()

private let appConfiguration: AppConfiguration = {
    return AppConfiguration()
}()

enum GetService {
    case getMovies(moviesRequestDTO: MoviesRequestDTO)
}

extension GetService: TargetType {
    var baseURL: URL {
        return URL(string: appConfiguration.apiBaseURL)!
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return "3/search/movie/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        var params: [String: Any] = [:]
        
        switch self {
        case .getMovies(let moviesRequestDTO):
            params = [
                "query" : moviesRequestDTO.query,
                "page" : moviesRequestDTO.page,
                "api_key" : appConfiguration.apiKey
            ]
        default:
            return .requestPlain
        }
        
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return [
            "Accept": "application/json"
        ]
    }
}
