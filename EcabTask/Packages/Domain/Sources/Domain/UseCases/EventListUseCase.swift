//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 12/09/2024.
//

import Common
import Foundation

public class EventListUseCase: EventListUseCaseProtocol {

    private let repository: CharactersLoaderRepositoryProtocol

    public init(repository: CharactersLoaderRepositoryProtocol) {
        self.repository = repository
    }

    public func execute() async throws -> GitHubEvents {
        do {
            let response = try await repository.loadEvents()
            return transformEventListResponse(response)
        } catch {
            throw error
        }
    }
    
    func transformEventListResponse(_ apiResponse: GitHubEvents) -> GitHubEvents {
        return apiResponse.map { event in
            let createdDate = DateTransformer.toReadableFormat(event.createdAt ?? "")
        
            return GitHubEvent(
                id: event.id,
                type: event.type,
                actor: event.actor,
                repo: event.repo,
                payload: event.payload,
                gitHubEventPublic: event.gitHubEventPublic,
                createdAt: createdDate
            )
        }
    }
}

