//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation

fileprivate enum Error: Swift.Error {
    case success
    case authenticationError
    case badRequest
    case outdated
    case failed
    case noData
    case unableToDecode
}

public protocol HTTPClient {
    func sendRequest<T:EndPointType, P:Codable>(_ requestBuilder: T, model: P.Type) async throws -> P
}

extension HTTPClient {
    public func sendRequest<T:EndPointType, P:Codable>(_ requestBuilder: T, model: P.Type) async throws -> P {
        let router = Router<T>()
        do {
            let(data, response) = try await router.request(requestBuilder)
            do {
                return try self.handleNetworkResponse(response, data, model: P.self)
            } catch {
                throw error
            }
        } catch {
            throw error
        }
    }
    
    fileprivate func handleNetworkResponse<T: Codable>(_ response: URLResponse, _ data: Data, model: T.Type) throws -> T {
        guard let response = response as? HTTPURLResponse else {throw Error.badRequest}
        let statusCode = response.statusCode
        switch response.statusCode {
        case 200...299:
            return try map(data, model: T.self)
        case 401...500:
            throw Error.authenticationError
        case 501...599:
            throw Error.badRequest
        case 600:
            throw Error.outdated
        default:
            throw Error.failed
        }
    }
    
    private func map<T: Codable>(_ data: Data, model: T.Type) throws -> T {
        do {
            let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            let obj:T = try JSONDecoder().decode(T.self, from: data)
            return obj
        }catch let error {
            throw error
        }
    }
}

