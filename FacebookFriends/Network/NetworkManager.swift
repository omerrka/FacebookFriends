//
//  NetworkManager.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 6.05.2023.
//


import Moya

protocol Networkable {
    var provider: MoyaProvider<UserAPI> { get }
    
    func fetchUsersResults(completion: @escaping (Result<Users, Error>) -> ())
    
}

class NetworkManager: Networkable {
    var provider = MoyaProvider<UserAPI>(plugins: [NetworkLoggerPlugin()])
    
    func fetchUsersResults(completion: @escaping (Result<Users, Error>) -> ()) {
        request(target: .usersList, completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: UserAPI, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

