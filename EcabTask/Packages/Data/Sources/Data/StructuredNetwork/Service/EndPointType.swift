//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation


public protocol EndPointType {
    var baseURL: URL { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

extension EndPointType {
    
    var environmentBaseURL : String {
        return "\(AppConfigManager.shared.getSelectedBaseURL())"
    }
    
    public var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var requestURL: URL {
        return baseURL
    }

}
