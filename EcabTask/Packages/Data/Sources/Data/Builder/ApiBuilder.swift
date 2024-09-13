//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation

public enum ApiBuilder {
    case character
}


extension ApiBuilder: EndPointType {
    
    
    public var headers: HTTPHeaders? {
        switch self {
        default:
            return defaultHeaders
        }
    }
    
    public var task: HTTPTask {
        switch self {
        default:
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil, additionHeaders: headers)
        }
        
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
}




