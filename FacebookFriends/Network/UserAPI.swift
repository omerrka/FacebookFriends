//
//  UserAPI.swift
//  FacebookFriends
//
//  Created by Ömer Karabulut on 6.05.2023.
//

import Moya

enum API {
    
    case usersList
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constants.baseURL) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .usersList:
            return ""
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .usersList:
            return .requestParameters(parameters: ["results": "20"], encoding: URLEncoding.queryString)
            
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
