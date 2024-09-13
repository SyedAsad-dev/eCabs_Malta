//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/09/2024.
//

import Foundation
import SwiftUI
import Domain

public enum AppRoute: Hashable {
    case EventListScreen(mainNav: NavigationStateProtocol)
    case DetailsScreen(mainNav: NavigationStateProtocol, character: GitHubEvent )
    
    public static func == (lhs: AppRoute, rhs: AppRoute) -> Bool {
        switch (lhs, rhs) {
        case (.EventListScreen, .EventListScreen):
            return true
        case let (.DetailsScreen(_,character1), .DetailsScreen(_,character2)):
            return character1.id == character2.id
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .EventListScreen:
            hasher.combine(0)
        case let .DetailsScreen(_,character):
            hasher.combine(character.id)
        }
    }
}

extension AppRoute: View, MainDependancyContainer {
    
    public var body: some View {
        switch self {
        case let .EventListScreen(mainNav):
            eventListViewContainer(mainNav: mainNav)
        case let .DetailsScreen(mainNav,character):
            detailsScreenCreator(mainNav: mainNav, event: character)
        }
    }
}
