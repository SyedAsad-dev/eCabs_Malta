//
//  File 5.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: AnyObject {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint) async throws -> (Data,URLResponse)
}

class Router<EndPoint: EndPointType>: NetworkRouter {
    
    func request(_ route: EndPoint) async throws -> (Data,URLResponse) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            NetworkLogger.log(request: request)
            return try await session.data(for: request)
        }catch {
            throw error
        }
    }
    
    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        
        var request = URLRequest(url: route.requestURL, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 3.0)
        
        request.httpMethod = route.httpMethod.rawValue
        
        do {
            switch route.task {
            case let .requestParametersAndHeaders(bodyParameters, bodyEncoding, urlParameters, additionalHeaders):
                self.addAdditionalHeaders(additionalHeaders,
                                          request: &request)
                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters,
                                             request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyParameters: Parameters?, bodyEncoding: ParameterEncoding, urlParameters: Parameters?, request: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(urlRequest: &request,
                                    bodyParameters: bodyParameters,
                                    urlParameters: urlParameters)
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}

