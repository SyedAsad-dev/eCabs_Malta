//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 12/09/2024.
//

import Common
import Domain

public typealias RemoteCharactersLoaderProtocols = CharactersLoaderRepositoryProtocol & HTTPClient
public final class RemoteCharactersLoader: RemoteCharactersLoaderProtocols {
    public init() { }
    
    public func loadEvents() async throws -> GitHubEvents {
        do {
            return try await sendRequest(ApiBuilder.character, model: GitHubEvents.self)
        } catch {
            throw error
        }
    }

}
