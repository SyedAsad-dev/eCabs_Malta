//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Domain

public class EventListMockService: EventListUseCaseProtocol {

    private let repository: CharactersLoaderRepositoryProtocol

    public init(repository: CharactersLoaderRepositoryProtocol) {
        self.repository = repository
    }
    var mockEvents: [GitHubEvent] = []
    
    public func execute() async throws -> GitHubEvents {
        do {
            return mockEvents
        } catch {
            throw error
        }
    }

}
