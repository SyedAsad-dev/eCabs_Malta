//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation
import SwiftUI
import Common
import EventList
import EventDetail
import Domain
import Data

public typealias MainDependancyContainer = EventListViewContainer & DetailsScreenCreator

public protocol EventListViewContainer {
    @ViewBuilder
    func eventListViewContainer(mainNav: NavigationStateProtocol) -> EventListView
}

extension EventListViewContainer {
    @MainActor
    public func eventListViewContainer(mainNav: NavigationStateProtocol) -> EventListView {
        EventListView(
            viewModel: VMCreator.ListViewModel(
                loader: EventListUseCase(repository: RemoteCharactersLoader())
            ),
            router: ListScreenRouter(mainNav: mainNav)
        )
    }
}

public protocol DetailsScreenCreator {
    @ViewBuilder
    func detailsScreenCreator(mainNav: NavigationStateProtocol, event: GitHubEvent) -> EventDetailsView
}

extension DetailsScreenCreator {
    @MainActor
    public func detailsScreenCreator(mainNav: NavigationStateProtocol, event: GitHubEvent) -> EventDetailsView {
        EventDetailsView(
            viewModel: VMCreator.EventViewModel(
                character: event
            ),
            router: DetailsScreenRouter(mainNav: mainNav)
        )
    }
}
