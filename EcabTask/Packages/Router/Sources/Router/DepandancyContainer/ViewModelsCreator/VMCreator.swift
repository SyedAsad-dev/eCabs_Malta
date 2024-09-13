//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation
import EventList
import EventDetail
import Common
import Domain

final class VMCreator {
    
    @MainActor
    static func ListViewModel(loader: EventListUseCaseProtocol) -> EventListViewModel {
        return EventListViewModel(loader: loader)
    }
    
    @MainActor
    static func EventViewModel(character: GitHubEvent) -> EventDetailsViewModel {
        return EventDetailsViewModel(event: character)
    }
}
